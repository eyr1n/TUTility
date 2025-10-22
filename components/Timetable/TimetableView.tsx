import {
  hideInternshipAtom,
  hideResearchAtom,
  termAtom,
  timetableAtom,
} from '@/atoms/timetable';
import { ThemedText } from '@/components/ThemedText';
import { Timetable } from '@/components/Timetable/Timetable';
import { useAtomValue } from 'jotai';
import React from 'react';
import { ScrollView, View } from 'react-native';

export function TimetableView() {
  const timetable = useAtomValue(timetableAtom);
  const term = useAtomValue(termAtom);
  const hideResearch = useAtomValue(hideResearchAtom);
  const hideInternship = useAtomValue(hideInternshipAtom);

  const firstOrSecond =
    term === 'firstHalf' ? timetable?.firstHalf : timetable?.secondHalf;

  return firstOrSecond ? (
    <ScrollView
      style={{ flex: 1 }}
      contentContainerStyle={{ alignItems: 'center', padding: 8 }}
      contentInsetAdjustmentBehavior="automatic"
    >
      <Timetable
        timetable={firstOrSecond}
        hideResearch={hideResearch}
        hideInternship={hideInternship}
      />
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
      <ThemedText style={{ textAlign: 'center' }}>
        右上のボタンから時間割を取得できます
      </ThemedText>
    </View>
  );
}
