import { useTheme } from '@/hooks/useTheme';
import { Text, type TextProps } from 'react-native';

export function ThemedText({ style, ...rest }: TextProps) {
  const theme = useTheme();
  return <Text style={[{ color: theme.foreground }, style]} {...rest} />;
}
