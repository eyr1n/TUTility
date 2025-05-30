import { timetableAtom } from '@/atoms/timetable';
import { TimetableScraperWebView } from '@/components/TimetableScraperWebView';
import { Stack, useRouter } from 'expo-router';
import { useSetAtom } from 'jotai';
import { Suspense, useState } from 'react';
import { View } from 'react-native';
import {
  ActivityIndicator,
  Button,
  Dialog,
  Portal,
  Text,
} from 'react-native-paper';

export default function TimetableScraperScreen() {
  return (
    <Suspense>
      <TimetableScraperScreenImpl />
    </Suspense>
  );
}

function TimetableScraperScreenImpl() {
  const router = useRouter();

  const setTimetable = useSetAtom(timetableAtom);

  const [scraperState, setScraperState] = useState<
    'idle' | 'loading' | 'successful' | 'failed'
  >('idle');

  return (
    <>
      <Stack.Screen options={{ title: '時間割の取得' }} />
      <View style={{ flex: 1 }}>
        <TimetableScraperWebView
          onLoad={() => {
            setScraperState('loading');
          }}
          onSuccess={(timetable) => {
            if (scraperState !== 'failed') {
              setScraperState('successful');
              setTimetable(timetable);
            }
          }}
          onFail={() => {
            setScraperState('failed');
          }}
        />
      </View>

      <Portal>
        <Dialog visible={scraperState === 'loading'}>
          <Dialog.Content style={{ gap: 8 }}>
            <ActivityIndicator size="large" />
            <Button
              onPress={() => {
                setScraperState('failed');
              }}
            >
              キャンセル
            </Button>
          </Dialog.Content>
        </Dialog>

        <Dialog
          visible={scraperState === 'successful'}
          onDismiss={() => {
            router.dismiss();
          }}
        >
          <Dialog.Content>
            <Text>時間割の取得が完了しました</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button
              onPress={() => {
                router.dismiss();
              }}
            >
              閉じる
            </Button>
          </Dialog.Actions>
        </Dialog>

        <Dialog
          visible={scraperState === 'failed'}
          onDismiss={() => {
            router.dismiss();
          }}
        >
          <Dialog.Content>
            <Text>時間割の取得時にエラーが発生しました</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button
              onPress={() => {
                router.dismiss();
              }}
            >
              閉じる
            </Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </>
  );
}
