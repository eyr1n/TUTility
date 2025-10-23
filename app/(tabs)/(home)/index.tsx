import { doNotShowNewsAtom } from '@/atoms/news';
import {
  hideInternshipAtom,
  hideResearchAtom,
  termAtom,
  timetableAtom,
} from '@/atoms/timetable';
import { OpenNewsScreen } from '@/components/OpenNewsScreen';
import { TimetableView } from '@/components/Timetable/TimetableView';
import { useThemeColors } from '@/constants/Colors';
import { useAlertDialog } from '@/hooks/useAlertDialog';
import { useConfirmDialog } from '@/hooks/useConfirmDialog';
import { MaterialIcons } from '@expo/vector-icons';
import PopupMenuAndroid, {
  PopupMenuAndroidInstance,
} from '@react-native/popup-menu-android';
import { HeaderButton } from '@react-navigation/elements';
import { Stack, useRouter } from 'expo-router';
import { useAtom, useAtomValue } from 'jotai';
import { useResetAtom } from 'jotai/utils';
import { Suspense, useRef } from 'react';

export default function TimetableScreen() {
  const router = useRouter();

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

  const theme = useThemeColors();

  const popupRef = useRef<PopupMenuAndroidInstance>(null);

  return (
    <>
      <Stack.Screen
        options={{
          title: firstOrSecond
            ? `${termLabel}${term === 'firstHalf' ? '1' : '2'}`
            : '時間割',
          contentStyle: { backgroundColor: theme.background },
          headerRight: () => (
            <>
              <HeaderButton
                onPress={() => {
                  router.push('/timetableScraper');
                }}
              >
                <MaterialIcons name="download" size={24} color={theme.text} />
              </HeaderButton>

              <HeaderButton
                onPress={() => {
                  popupRef.current?.show();
                }}
              >
                <PopupMenuAndroid
                  menuItems={[
                    `${termLabel}${term === 'firstHalf' ? '2' : '1'}に切り替え`,
                    `卒業研究を${hideResearch ? '表示' : '非表示'}`,
                    `実務訓練を${hideInternship ? '表示' : '非表示'}`,
                    `お知らせを${doNotShowNews ? '表示' : '非表示'}`,
                    '時間割をリセット',
                    'ライセンス',
                  ]}
                  onSelectionChange={async (i) => {
                    switch (i) {
                      case 0:
                        setTerm(
                          term === 'firstHalf' ? 'secondHalf' : 'firstHalf',
                        );
                        break;
                      case 1:
                        setHideResearch(!hideResearch);
                        break;
                      case 2:
                        setHideInternship(!hideInternship);
                        break;
                      case 3:
                        setDoNotShowNews(!doNotShowNews);
                        break;
                      case 4:
                        if (await confirm('時間割をリセットしますか?')) {
                          await resetTimetable();
                          await alert('時間割のリセットが完了しました');
                        }
                        break;
                      case 5:
                        router.push('/licenses');
                        break;
                    }
                  }}
                  onDismiss={() => {}}
                  instanceRef={popupRef}
                >
                  <MaterialIcons
                    name="more-horiz"
                    size={24}
                    color={theme.text}
                  />
                </PopupMenuAndroid>
              </HeaderButton>
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
