import { Stack } from 'expo-router';
import { WebView } from 'react-native-webview';

export default function OshiraseScreen() {
  return (
    <>
      <Stack.Screen options={{ title: 'お知らせ', presentation: 'modal' }} />
      <WebView
        style={{ flex: 1 }}
        source={{ uri: 'https://canteen.opentut.gr.jp' }}
      />
    </>
  );
}
