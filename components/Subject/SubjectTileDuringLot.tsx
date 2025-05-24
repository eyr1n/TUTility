import { useScale } from '@/hooks/useScale';
import { View } from 'react-native';
import { MD3LightTheme, Text, useTheme } from 'react-native-paper';
import { SubjectTileBase } from './SubjectTileBase';

export function SubjectTileDuringLot() {
  const theme = useTheme();
  const scale = useScale();

  return (
    <SubjectTileBase backgroundColor={theme.colors.inverseOnSurface}>
      <View style={{ flex: 1, padding: 2 }}>
        <Text
          style={{
            fontSize: 12 * scale,
            lineHeight: 1.2 * 12 * scale,
            textAlign: 'center',
            color: MD3LightTheme.colors.onSurface,
          }}
        >
          抽選中
        </Text>
      </View>
    </SubjectTileBase>
  );
}
