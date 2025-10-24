import { doNotShowNewsAtom } from '@/atoms/news';
import {
  hideInternshipAtom,
  hideResearchAtom,
  termAtom,
  timetableAtom,
} from '@/atoms/timetable';
import { OpenNewsScreen } from '@/components/OpenNewsScreen';
import { TimetableView } from '@/components/Timetable/TimetableView';
import { useAlertDialog } from '@/hooks/useAlertDialog';
import { useConfirmDialog } from '@/hooks/useConfirmDialog';
import { useTheme } from '@/hooks/useTheme';
import { Button, ContextMenu, Host, Switch } from '@expo/ui/swift-ui';
import { HeaderButton } from '@react-navigation/elements';
import { Stack, useRouter } from 'expo-router';
import { SymbolView } from 'expo-symbols';
import { useAtom, useAtomValue } from 'jotai';
import { useResetAtom } from 'jotai/utils';
import React, { Suspense } from 'react';
import { Platform, View } from 'react-native';

export default function TimetableScreen() {
  const router = useRouter();
    const theme = useTheme();

  const timetable = useAtomValue(timetableAtom);
  const [term, setTerm] = useAtom(termAtom);
  const [hideResearch, setHideResearch] = useAtom(hideResearchAtom);
  const [hideInternship, setHideInternship] = useAtom(hideInternshipAtom);
  const [doNotShowNews, setDoNotShowNews] = useAtom(doNotShowNewsAtom);
  const resetTimetable = useResetAtom(timetableAtom);

  const termLabel = timetable?.term === 'spring' ? '前期' : '後期';
  const firstOrSecond =
    term === 'firstHalf' ? timetable?.firstHalf : timetable?.secondHalf;

  const alert = useAlertDialog();
  const confirm = useConfirmDialog();



  const majorVersionIOS =
    typeof Platform.Version === 'string'
      ? parseInt(Platform.Version, 10)
      : Platform.Version;

  return (
    <>
      <Stack.Screen
        options={{
          title: firstOrSecond
            ? `${termLabel}${term === 'firstHalf' ? '1' : '2'}`
            : '時間割',
          headerLargeTitle: true,
          headerTransparent: true,
          contentStyle: { backgroundColor: theme.background },
          headerRight: () => (
            <>
              <HeaderButton
                onPress={() => {
                  router.push('/timetableScraper');
                }}
              >
                <SymbolView
                  name="arrow.down"
                  tintColor={majorVersionIOS >= 26 ? theme.foreground : undefined}
                />
              </HeaderButton>

              <Host matchContents>
                <ContextMenu activationMethod="singlePress">
                  <ContextMenu.Items>
                    <Button
                      onPress={() => {
                        setTerm(
                          term === 'firstHalf' ? 'secondHalf' : 'firstHalf',
                        );
                      }}
                    >
                      {termLabel}
                      {term === 'firstHalf' ? '2' : '1'}に切り替え
                    </Button>
                    <Switch
                      value={hideResearch}
                      onValueChange={setHideResearch}
                      label="卒業研究を非表示"
                    />
                    <Switch
                      value={hideInternship}
                      onValueChange={setHideInternship}
                      label="実務訓練を非表示"
                    />
                    <Switch
                      value={doNotShowNews}
                      onValueChange={setDoNotShowNews}
                      label="お知らせを非表示"
                    />
                    <Button
                      onPress={async () => {
                        if (await confirm('時間割をリセットしますか?')) {
                          await resetTimetable();
                          await alert('時間割のリセットが完了しました');
                        }
                      }}
                    >
                      時間割をリセット
                    </Button>
                    <Button
                      onPress={() => {
                        router.push('/licenses');
                      }}
                    >
                      ライセンス
                    </Button>
                  </ContextMenu.Items>
                  <ContextMenu.Trigger>
                    <View>
                      <HeaderButton>
                        <SymbolView
                          name="ellipsis"
                          tintColor={
                            majorVersionIOS >= 26 ? theme.foreground : undefined
                          }
                        />
                      </HeaderButton>
                    </View>
                  </ContextMenu.Trigger>
                </ContextMenu>
              </Host>
            </>
          ),
        }}
      />
      <TimetableView />
      <Suspense>
        <OpenNewsScreen />
      </Suspense>
    </>
  );
}
