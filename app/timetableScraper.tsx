import { timetableAtom } from '@/atoms/timetable';
import { TimetableScraperWebView } from '@/components/TimetableScraperWebView';
import { useAlertDialog } from '@/hooks/useAlertDialog';
import { Stack, useRouter } from 'expo-router';
import { useSetAtom } from 'jotai';
import { Suspense, useState } from 'react';
import { View } from 'react-native';
import { ActivityIndicator, Button, Dialog, Portal } from 'react-native-paper';

export default function TimetableScraperScreen() {
  return (
    <Suspense>
      <TimetableScraperScreenImpl />
    </Suspense>
  );
}

function TimetableScraperScreenImpl() {
  const router = useRouter();
  const alert = useAlertDialog();

  const setTimetable = useSetAtom(timetableAtom);

  const [loading, setLoading] = useState(false);

  return (
    <>
      <Stack.Screen options={{ title: '時間割の取得' }} />
      <View style={{ flex: 1 }}>
        <TimetableScraperWebView
          onLoad={() => {
            setLoading(true);
          }}
          onSuccess={async (timetable) => {
            if (loading) {
              setLoading(false);
              setTimetable(timetable);
              await alert('時間割の取得が完了しました');
              router.dismiss();
            }
          }}
          onFail={async () => {
            if (loading) {
              setLoading(false);
              await alert('時間割の取得時にエラーが発生しました');
              router.dismiss();
            }
          }}
        />
      </View>

      <Portal>
        <Dialog visible={loading}>
          <Dialog.Content style={{ gap: 8 }}>
            <ActivityIndicator size="large" />
            <Button
              onPress={() => {
                setLoading(false);
                router.dismiss();
              }}
            >
              キャンセル
            </Button>
          </Dialog.Content>
        </Dialog>
      </Portal>
    </>
  );
}
