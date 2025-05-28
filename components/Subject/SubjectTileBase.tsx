import { PropsWithChildren } from 'react';
import { ColorValue, View } from 'react-native';
import { TouchableRipple } from 'react-native-paper';

interface SubjectBaseProps {
  backgroundColor: ColorValue;
  borderColor?: ColorValue;
  onPress?: () => void;
}

export function SubjectTileBase({
  backgroundColor,
  borderColor,
  onPress,
  children,
}: PropsWithChildren<SubjectBaseProps>) {
  return (
    <View style={{ flex: 1, aspectRatio: 3 / 4 }}>
      <TouchableRipple
        style={{
          flex: 1,
          margin: 2,
          borderRadius: 4,
          overflow: 'hidden',
          backgroundColor,
          borderColor,
          borderWidth: borderColor ? 1 : undefined,
        }}
        onPress={onPress}
      >
        <View style={{ flex: 1 }}>{children}</View>
      </TouchableRipple>
    </View>
  );
}
