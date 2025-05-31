import {
  hideInternshipAtom,
  hideResearchAtom,
  timetableAtom,
} from '@/atoms/timetable';
import { useAlertDialog } from '@/components/AlertDialogProvider';
import { useConfirmDialog } from '@/components/ConfirmDialogProvider';
import { nativeApplicationVersion } from 'expo-application';
import { useRouter } from 'expo-router';
import { useAtom } from 'jotai';
import { useResetAtom } from 'jotai/utils';
import { Suspense } from 'react';
import { ScrollView } from 'react-native';
import { Divider, List, Switch } from 'react-native-paper';

export default function MiscScreen() {
  return (
    <Suspense>
      <MiscScreenImpl />
    </Suspense>
  );
}

function MiscScreenImpl() {
  const router = useRouter();
  const alert = useAlertDialog();
  const confirm = useConfirmDialog();

  const [hideResearch, setHideResearch] = useAtom(hideResearchAtom);
  const [hideInternship, setHideInternship] = useAtom(hideInternshipAtom);
  const resetTimetable = useResetAtom(timetableAtom);

  return (
    <>
      <ScrollView style={{ flex: 1 }}>
        <List.Item
          title="卒業研究を非表示"
          right={() => (
            <Switch value={hideResearch} onValueChange={setHideResearch} />
          )}
        />
        <Divider />
        <List.Item
          title="実務訓練を非表示"
          right={() => (
            <Switch value={hideInternship} onValueChange={setHideInternship} />
          )}
        />
        <Divider />
        <List.Item
          title="時間割をリセット"
          onPress={async () => {
            if (await confirm('時間割をリセットしますか?')) {
              await resetTimetable();
              await alert('時間割のリセットが完了しました');
            }
          }}
        />
        <Divider />
        <List.Item
          title="ライセンス"
          onPress={() => {
            router.push('/licenses');
          }}
        />
        <Divider />
        <List.Item title={`TUTility v${nativeApplicationVersion}`} />
      </ScrollView>
    </>
  );
}
