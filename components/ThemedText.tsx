import { useThemeColors } from '@/constants/Colors';
import { Text, type TextProps } from 'react-native';

export function ThemedText({ style, ...rest }: TextProps) {
  const color = useThemeColors().text;

  return <Text style={[{ color }, style]} {...rest} />;
}
