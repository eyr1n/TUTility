import { useThemeColors } from '@/constants/Colors';
import { Stack } from 'expo-router';
import { useColorScheme } from 'react-native';
import { WebView } from 'react-native-webview';

export default function CanteenScreen() {
  const theme = useThemeColors();
  const colorScheme = useColorScheme();

  return (
    <>
      <Stack.Screen
        options={{
          title: '食堂メニュー',
        }}
      />
      <WebView
        indicatorStyle={colorScheme === 'dark' ? 'white' : 'default'}
        style={{ flex: 1, backgroundColor: 'transparent' }}
        source={{ uri: 'https://canteen.opentut.gr.jp/inapp' }}
        contentInsetAdjustmentBehavior="automatic"
      />
    </>
  );
}
