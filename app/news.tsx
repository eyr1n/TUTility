import { doNotShowNewsAtom } from '@/atoms/news';
import { useAlertDialog } from '@/hooks/useAlertDialog';
import { useConfirmDialog } from '@/hooks/useConfirmDialog';
import { Stack } from 'expo-router';
import { useSetAtom } from 'jotai';
import { Button, View } from 'react-native';
import { WebView } from 'react-native-webview';

export default function NewsScreen() {
  const alert = useAlertDialog();
  const confirm = useConfirmDialog();

  const setDoNotShowNews = useSetAtom(doNotShowNewsAtom);

  return (
    <>
      <Stack.Screen
        options={{
          title: 'お知らせ',
          headerRight: () => (
            <Button
              onPress={async () => {
                if (
                  await confirm('起動時にお知らせを表示しないようにしますか?')
                ) {
                  setDoNotShowNews(true);
                  await alert('今後、起動時にお知らせを表示しません');
                }
              }}
              title="今後表示しない"
            ></Button>
          ),
        }}
      />
      <View style={{ flex: 1 }}>
        <WebView
          style={{ flex: 1 }}
          source={{ uri: 'https://opentut.gr.jp/news' }}
        />
      </View>
    </>
  );
}
