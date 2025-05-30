import {
  hideInternshipAtom,
  hideResearchAtom,
  timetableAtom,
} from '@/atoms/timetable';
import { nativeApplicationVersion } from 'expo-application';
import { useRouter } from 'expo-router';
import { useAtom } from 'jotai';
import { useResetAtom } from 'jotai/utils';
import { useState } from 'react';
import { ScrollView } from 'react-native';
import {
  Button,
  Dialog,
  Divider,
  List,
  Portal,
  Switch,
  Text,
} from 'react-native-paper';

export default function MiscScreen() {
  const router = useRouter();

  const [hideResearch, setHideResearch] = useAtom(hideResearchAtom);
  const [hideInternship, setHideInternship] = useAtom(hideInternshipAtom);
  const resetTimetable = useResetAtom(timetableAtom);

  const [resetState, setResetState] = useState<'idle' | 'confirm' | 'done'>(
    'idle',
  );

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
          onPress={() => {
            setResetState('confirm');
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

      <Portal>
        <Dialog
          visible={resetState === 'confirm'}
          onDismiss={() => {
            setResetState('idle');
          }}
        >
          <Dialog.Content>
            <Text>時間割をリセットしますか?</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button
              onPress={() => {
                setResetState('idle');
              }}
            >
              キャンセル
            </Button>
            <Button
              onPress={async () => {
                await resetTimetable();
                setResetState('done');
              }}
            >
              OK
            </Button>
          </Dialog.Actions>
        </Dialog>

        <Dialog
          visible={resetState === 'done'}
          onDismiss={() => {
            setResetState('idle');
          }}
        >
          <Dialog.Content>
            <Text>時間割のリセットが完了しました</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button
              onPress={() => {
                setResetState('idle');
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
