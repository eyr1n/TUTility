import { useScale } from '@/hooks/useScale';
import { View } from 'react-native';
import { ThemedText } from '../ThemedText';

interface TimetablePeriodProps {
  period: number;
  begin: string;
  end: string;
}

export function TimetablePeriod({ period, begin, end }: TimetablePeriodProps) {
  const scale = useScale();

  return (
    <View
      style={{
        flex: 1,
        gap: 2,
        margin: 2,
        justifyContent: 'center',
        alignItems: 'center',
      }}
    >
      <ThemedText style={{ fontSize: 10 * scale }} allowFontScaling={false}>
        {begin}
      </ThemedText>
      <ThemedText
        style={{ fontSize: 13 * scale, fontWeight: 'bold' }}
        allowFontScaling={false}
      >
        {period}
      </ThemedText>
      <ThemedText style={{ fontSize: 10 * scale }} allowFontScaling={false}>
        {end}
      </ThemedText>
    </View>
  );
}
