import { useScale } from '@/hooks/useScale';
import { useTheme } from '@/hooks/useTheme';
import { Text, View } from 'react-native';
import { SubjectTileBase } from './SubjectTileBase';

export function SubjectTileDuringLot() {
    const theme = useTheme();
  const scale = useScale();


  return (
    <SubjectTileBase backgroundColor={theme.secondaryBackground}>
      <View style={{ flex: 1, padding: 2 }}>
        <Text
          style={{
            fontSize: 12 * scale,
            lineHeight: 1.2 * 12 * scale,
            textAlign: 'center',
          }}
          allowFontScaling={false}
        >
          抽選中
        </Text>
      </View>
    </SubjectTileBase>
  );
}
