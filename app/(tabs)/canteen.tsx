import { WebView } from 'react-native-webview';

export default function CanteenScreen() {
  return (
    <WebView
      style={{ flex: 1, backgroundColor: 'transparent' }}
      source={{ uri: 'https://canteen.opentut.gr.jp/inapp' }}
    />
  );
}
