import { MaxTimetableWidth } from '@/constants/TimetableWidth';
import { useState } from 'react';
import { View } from 'react-native';
import { Subject } from 'timetable-scraper';
import { SubjectTile } from '../Subject/SubjectTile';
import { SubjectTileDuringLot } from '../Subject/SubjectTileDuringLot';
import { SubjectTileEmpty } from '../Subject/SubjectTileEmpty';
import { TimetablePeriod } from './TimetablePeriod';
import { TimetableWeekday, Weekday } from './TimetableWeekday';

interface TimetableProps {
  timetable: (Subject | null)[][];
  hideResearch: boolean;
  hideInternship: boolean;
}

export function Timetable({
  timetable,
  hideResearch,
  hideInternship,
}: TimetableProps) {
  const [headerHeight, setHeaderHeight] = useState<number>();

  return (
    <View
      style={{
        flex: 1,
        flexDirection: 'row',
        gap: 4,
        maxWidth: MaxTimetableWidth,
        ...(headerHeight == null && { opacity: 0, pointerEvents: 'none' }),
      }}
    >
      <View style={{ gap: 2 }}>
        <View style={{ height: headerHeight }}></View>
        <View style={{ flex: 1 }}>
          <TimetablePeriod period={1} begin="8:50" end="10:20" />
          <TimetablePeriod period={2} begin="10:30" end="12:00" />
          <TimetablePeriod period={3} begin="13:00" end="14:30" />
          <TimetablePeriod period={4} begin="14:40" end="16:10" />
          <TimetablePeriod period={5} begin="16:20" end="17:50" />
          <TimetablePeriod period={6} begin="18:00" end="19:30" />
        </View>
      </View>

      <View style={{ flex: 1, gap: 2 }}>
        <View
          onLayout={(e) => {
            setHeaderHeight(e.nativeEvent.layout.height);
          }}
          style={{ flex: 1, flexDirection: 'row' }}
        >
          <TimetableWeekday weekday={Weekday.Monday} />
          <TimetableWeekday weekday={Weekday.Tuesday} />
          <TimetableWeekday weekday={Weekday.Wednesday} />
          <TimetableWeekday weekday={Weekday.Thursday} />
          <TimetableWeekday weekday={Weekday.Friday} />
        </View>

        <View style={{ flex: 1 }}>
          {timetable.map((row, i) => (
            <View key={i} style={{ flex: 1, flexDirection: 'row' }}>
              {row.map((subject, j) =>
                subject == null ||
                subject.status === 'canceled' ||
                subject.status === 'lot_rejected' ||
                (hideResearch && subject.name.includes('卒業研究')) ||
                (hideInternship && subject.name.includes('実務訓練')) ? (
                  <SubjectTileEmpty key={`${i},${j}`} />
                ) : subject.status === 'lot_pending' ? (
                  <SubjectTileDuringLot key={`${i},${j}`} />
                ) : (
                  <SubjectTile key={`${i},${j}`} subject={subject} />
                ),
              )}
            </View>
          ))}
        </View>
      </View>
    </View>
  );
}
