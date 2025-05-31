import { doNotShowNewsAtom } from '@/atoms/news';
import { useAlertDialog } from '@/hooks/useAlertDialog';
import { useConfirmDialog } from '@/hooks/useConfirmDialog';
import { Stack } from 'expo-router';
import { useSetAtom } from 'jotai';
import { View } from 'react-native';
import { Appbar, Button } from 'react-native-paper';
import { WebView } from 'react-native-webview';

export default function NewsScreen() {
  const alert = useAlertDialog();
  const confirm = useConfirmDialog();

  const setDoNotShowNews = useSetAtom(doNotShowNewsAtom);

  return (
    <>
      <Stack.Screen
        options={{
          header: ({ navigation, back }) => (
            <Appbar.Header elevated>
              {back != null && (
                <Appbar.BackAction onPress={() => navigation.goBack()} />
              )}
              <Appbar.Content title="お知らせ" />
              <Button
                onPress={async () => {
                  if (
                    await confirm('起動時にお知らせを表示しないようにしますか?')
                  ) {
                    setDoNotShowNews(true);
                    await alert('今後、起動時にお知らせを表示しません');
                  }
                }}
              >
                今後表示しない
              </Button>
            </Appbar.Header>
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
