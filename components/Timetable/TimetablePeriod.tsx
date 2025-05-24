import { useScale } from '@/hooks/useScale';
import { View } from 'react-native';
import { Text } from 'react-native-paper';

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
      <Text style={{ fontSize: 10 * scale }}>{begin}</Text>
      <Text style={{ fontSize: 13 * scale, fontWeight: 'bold' }}>{period}</Text>
      <Text style={{ fontSize: 10 * scale }}>{end}</Text>
    </View>
  );
}
