import WebView, { WebViewMessageEvent } from 'react-native-webview';
import { Timetable, WebViewMessage } from 'timetable-scraper';
import scraperCode from 'timetable-scraper/browser';

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
          onSuccess(await Timetable.parseAsync(message.data));
          break;
        default:
          throw new Error('error');
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
    ${scraperCode}
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
