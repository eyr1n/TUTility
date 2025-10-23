import { timetableAtom } from '@/atoms/timetable';
import { TimetableScraperWebView } from '@/components/TimetableScraperWebView';
import { useAlertDialog } from '@/hooks/useAlertDialog';
import { useRouter } from 'expo-router';
import { useSetAtom } from 'jotai';
import { Suspense, useState } from 'react';
import { View } from 'react-native';

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
      <View style={{ flex: 1, position: 'relative' }}>
        <View
          style={{
            flex: 1,
            opacity: loading ? 0 : 1,
            pointerEvents: loading ? 'none' : undefined,
          }}
        >
          <TimetableScraperWebView
            onLoad={() => {
              setLoading(true);
            }}
            onSuccess={async (timetable) => {
              if (loading) {
                setTimetable(timetable);
                await alert('時間割の取得が完了しました');
                router.dismiss();
                setLoading(false);
              }
            }}
            onFail={async () => {
              if (loading) {
                await alert('時間割の取得時にエラーが発生しました');
                router.dismiss();
                setLoading(false);
              }
            }}
          />
        </View>
        {loading
          ? null
          : /* <Host
            style={{
              position: 'absolute',
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              justifyContent: 'center',
              alignItems: 'center',
            }}
          >
            <VStack spacing={16}>
              <CircularProgress />
              <Button
                variant="bordered"
                onPress={() => {
                  router.dismiss();
                  setLoading(false);
                }}
              >
                キャンセル
              </Button>
            </VStack>
          </Host> */
            null}
      </View>
    </>
  );
}
