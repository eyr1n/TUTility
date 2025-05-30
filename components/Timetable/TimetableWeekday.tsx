import { useScale } from '@/hooks/useScale';
import { View } from 'react-native';
import { Text, useTheme } from 'react-native-paper';

export const Weekday = {
  Monday: { value: 1, label: '月' },
  Tuesday: { value: 2, label: '火' },
  Wednesday: { value: 3, label: '水' },
  Thursday: { value: 4, label: '木' },
  Friday: { value: 5, label: '金' },
} as const;

interface TimetableWeekdayProps {
  weekday: (typeof Weekday)[keyof typeof Weekday];
}

export function TimetableWeekday({ weekday }: TimetableWeekdayProps) {
  const theme = useTheme();
  const scale = useScale();

  return (
    <View
      style={{
        flex: 1,
        margin: 2,
        alignItems: 'center',
      }}
    >
      <View
        style={{
          paddingHorizontal: 16 * scale,
          paddingVertical: 2 * scale,
          ...(weekday.value === new Date().getDay() && {
            borderRadius: 100,
            backgroundColor: theme.colors.primaryContainer,
          }),
        }}
      >
        <Text style={{ fontSize: 13 * scale, fontWeight: 'bold' }}>
          {weekday.label}
        </Text>
      </View>
    </View>
  );
}
