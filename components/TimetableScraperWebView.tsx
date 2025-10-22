import WebView, { WebViewMessageEvent } from 'react-native-webview';
import {
  DreamCampusTimetable,
  getTimetable,
  Subject,
  Timetable,
  WebViewMessage,
} from 'timetable-scraper';
import scraperJs from 'timetable-scraper/browser';
import { z } from 'zod';

interface TimetableScraperWebViewProps {
  onLoad: () => void;
  onSuccess: (timetable: Timetable) => void;
  onFail: (error: unknown) => void;
}

export function TimetableScraperWebView({
  onLoad,
  onSuccess,
  onFail,
}: TimetableScraperWebViewProps) {
  const onMessage = async (event: WebViewMessageEvent) => {
    try {
      const message = WebViewMessage.parse(JSON.parse(event.nativeEvent.data));
      switch (message.type) {
        case 'loading':
          onLoad();
          break;
        case 'successful':
          const dreamCampusTimetable = DreamCampusTimetable.parse(message.data);
          const timetable = Timetable.parse(getTimetable(dreamCampusTimetable));
          const replacedTimetable = await mergeTimetable(timetable).catch(
            () => timetable,
          );
          onSuccess(replacedTimetable);
          break;
        default:
          throw new Error('failed to get timetable');
      }
    } catch (error) {
      onFail(error);
    }
  };

  const injectedJavaScript = `(() => {
  if (
    location.href ===
    'https://kyomu.office.tut.ac.jp/portal/StudentApp/Top.aspx'
  ) {
    window.ReactNativeWebView.postMessage(JSON.stringify({ type: 'loading' }));
    (
      document.querySelector('#ctl00_bhHeader_ctl350_lnk') ??
      document.querySelector('#ctl00_bhHeader_ctl33_lnk')
    ).click();
    return;
  }

  if (
    location.href ===
    'https://kyomu.office.tut.ac.jp/portal/StudentApp/Blank.aspx#regist_results'
  ) {
    document.querySelector('#ctl00_bhHeader_ctl47_lnk').click();
    return;
  }

  if (
    location.href ===
    'https://kyomu.office.tut.ac.jp/portal/StudentApp/Regist/RegistList.aspx'
  ) {
    ${scraperJs}
    return;
  }
})();
true;`;

  return (
    <WebView
      style={{ flex: 1 }}
      source={{ uri: 'https://kyomu.office.tut.ac.jp/portal/' }}
      onMessage={onMessage}
      injectedJavaScript={injectedJavaScript}
    />
  );
}

async function mergeTimetable(timetable: Timetable): Promise<Timetable> {
  const syllabusJson = await fetch(
    `https://syllabus.opentut.gr.jp/ja/${timetable.year}/all.min.json`,
  );
  const syllabus = z.record(Subject.partial()).parse(await syllabusJson.json());

  const merge = (timetable: (Subject | null)[][]) =>
    timetable.map((row) =>
      row.map((subject) =>
        subject != null
          ? subject.id in syllabus
            ? { ...subject, ...syllabus[subject.id] }
            : subject
          : null,
      ),
    );

  return {
    ...timetable,
    firstHalf: merge(timetable.firstHalf),
    secondHalf: merge(timetable.secondHalf),
    intensive: merge(timetable.intensive),
  };
}
