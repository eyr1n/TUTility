import { doNotShowNewsAtom } from '@/atoms/news';
import {
  hideInternshipAtom,
  hideResearchAtom,
  timetableAtom,
} from '@/atoms/timetable';
import { useAlertDialog } from '@/hooks/useAlertDialog';
import { useConfirmDialog } from '@/hooks/useConfirmDialog';
import { nativeApplicationVersion } from 'expo-application';
import { useRouter } from 'expo-router';
import { useAtom } from 'jotai';
import { useResetAtom } from 'jotai/utils';
import { ScrollView } from 'react-native';
import { List, Switch } from 'react-native-paper';

export default function MiscScreen() {
  const router = useRouter();
  const alert = useAlertDialog();
  const confirm = useConfirmDialog();

  const [hideResearch, setHideResearch] = useAtom(hideResearchAtom);
  const [hideInternship, setHideInternship] = useAtom(hideInternshipAtom);
  const [doNotShowNews, setDoNotShowNews] = useAtom(doNotShowNewsAtom);
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
        <List.Item
          title="実務訓練を非表示"
          right={() => (
            <Switch value={hideInternship} onValueChange={setHideInternship} />
          )}
        />
        <List.Item
          title="お知らせを非表示"
          right={() => (
            <Switch value={doNotShowNews} onValueChange={setDoNotShowNews} />
          )}
        />
        <List.Item
          title="時間割をリセット"
          onPress={async () => {
            if (await confirm('時間割をリセットしますか?')) {
              await resetTimetable();
              await alert('時間割のリセットが完了しました');
            }
          }}
        />
        <List.Item
          title="ライセンス"
          onPress={() => {
            router.push('/licenses');
          }}
        />
        <List.Item title={`TUTility v${nativeApplicationVersion}`} />
      </ScrollView>
    </>
  );
}
