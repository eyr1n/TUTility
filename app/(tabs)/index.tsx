import { termAtom, timetableAtom } from '@/atoms';
import { Timetable } from '@/components/Timetable/Timetable';
import { Stack, useRouter } from 'expo-router';
import { useAtom, useAtomValue } from 'jotai';
import { ScrollView, View } from 'react-native';
import { Appbar, SegmentedButtons, Text } from 'react-native-paper';

export default function TimetableScreen() {
  const router = useRouter();

  const timetable = useAtomValue(timetableAtom);
  const [term, setTerm] = useAtom(termAtom);

  const semesterLabel = timetable?.semester === 'spring' ? '前期' : '後期';
  const firstOrSecond =
    term === 'firstHalf' ? timetable?.firstHalf : timetable?.secondHalf;

  return (
    <>
      <Stack.Screen
        options={{
          header: () => (
            <Appbar.Header mode="center-aligned">
              <Appbar.Content
                title={
                  timetable ? (
                    <SegmentedButtons
                      value={term}
                      onValueChange={setTerm}
                      buttons={[
                        {
                          value: 'firstHalf',
                          label: `${semesterLabel}1`,
                          style: { flex: 0 },
                        },
                        {
                          value: 'secondHalf',
                          label: `${semesterLabel}2`,
                          style: { flex: 0 },
                        },
                      ]}
                    />
                  ) : null
                }
              />
              <Appbar.Action
                icon="download"
                onPress={() => {
                  router.push('/timetableScraper');
                }}
              />
            </Appbar.Header>
          ),
        }}
      />
      {firstOrSecond ? (
        <ScrollView
          style={{ flex: 1 }}
          contentContainerStyle={{ alignItems: 'center', padding: 8 }}
        >
          <Timetable timetable={firstOrSecond} />
        </ScrollView>
      ) : (
        <View
          style={{
            flex: 1,
            justifyContent: 'center',
            alignItems: 'center',
            padding: 8,
          }}
        >
          <Text style={{ textAlign: 'center' }}>
            右上のボタンから時間割を取得できます
          </Text>
        </View>
      )}
    </>
  );
}
