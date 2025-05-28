import { Subject } from '@/schemas/subject';
import { Timetable } from '@/schemas/timetable';
import WebView, { WebViewMessageEvent } from 'react-native-webview';
import {
  DreamCampusTimetable,
  getTimetable,
  Timetable as ScraperTimetable,
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
      const message = await WebViewMessage.parseAsync(
        JSON.parse(event.nativeEvent.data),
      );
      switch (message.type) {
        case 'loading':
          onLoad();
          break;
        case 'timetable':
          const dreamCampusTimetable = await DreamCampusTimetable.parseAsync(
            message.data,
          );
          const timetable = await ScraperTimetable.parseAsync(
            getTimetable(dreamCampusTimetable),
          );
          const replacedTimetable = await convertScraperTimetable(
            timetable,
          ).catch(() => timetable);
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

async function convertScraperTimetable(
  scraperTimetable: ScraperTimetable,
): Promise<Timetable> {
  const syllabusJson = await fetch(
    `https://syllabus.opentut.gr.jp/ja/${scraperTimetable.year}/all.min.json`,
  );
  const syllabus = await z
    .record(Subject)
    .parseAsync(await syllabusJson.json());

  const replace = (timetable: (Subject | null)[][]) =>
    timetable.map((row) =>
      row.map((subject) =>
        subject != null
          ? subject.id in syllabus
            ? syllabus[subject.id]
            : subject
          : null,
      ),
    );

  return {
    ...scraperTimetable,
    firstHalf: replace(scraperTimetable.firstHalf),
    secondHalf: replace(scraperTimetable.secondHalf),
    intensive: replace(scraperTimetable.intensive),
  };
}
