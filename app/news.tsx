import { doNotShowAgainNewsAtom } from '@/atoms/news';
import { useAlertDialog } from '@/components/AlertDialogProvider';
import { useConfirmDialog } from '@/components/ConfirmDialogProvider';
import { Stack } from 'expo-router';
import { useSetAtom } from 'jotai';
import { Suspense } from 'react';
import { View } from 'react-native';
import { Appbar, Button } from 'react-native-paper';
import { WebView } from 'react-native-webview';

export default function NewsScreen() {
  return (
    <Suspense>
      <NewsScreenImpl />
    </Suspense>
  );
}

function NewsScreenImpl() {
  const alert = useAlertDialog();
  const confirm = useConfirmDialog();

  const setDoNotShowAgainNews = useSetAtom(doNotShowAgainNewsAtom);

  return (
    <>
      <Stack.Screen
        options={{
          presentation: 'modal',
          header: ({ navigation, route, options, back }) => (
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
                    setDoNotShowAgainNews(true);
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
