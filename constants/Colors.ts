import {
  OpaqueColorValue,
  Platform,
  PlatformColor,
  useColorScheme,
} from 'react-native';

export const ThemeColors = {
  light: {
    primary: 'rgb(186, 26, 32)',
    primaryContainer: 'rgb(255, 218, 214)',
    text: Platform.select({
      ios: PlatformColor('label'),
      android: PlatformColor('?attr:colorForeground'),
    }),
    background: Platform.select({
      ios: PlatformColor('systemBackground'),
      android: 'rgb(255, 251, 255)',
    }),
    secondaryBackground: Platform.select<OpaqueColorValue | string>({
      ios: PlatformColor('secondarySystemBackground'),
      android: 'rgb(251, 238, 236)',
    }),
  },
  dark: {
    primary: 'rgb(255, 179, 172)',
    primaryContainer: 'rgb(147, 0, 16)',
    text: Platform.select({
      ios: PlatformColor('label'),
      android: PlatformColor('?attr:colorForeground'),
    }),
    background: Platform.select({
      ios: PlatformColor('systemBackground'),
      android: 'rgb(32, 26, 25)',
    }),
    secondaryBackground: Platform.select({
      ios: PlatformColor('secondarySystemBackground'),
      android: 'rgb(54, 47, 46)',
    }),
  },
} as const;

export function useThemeColors() {
  const colorScheme = useColorScheme();
  return colorScheme === 'dark' ? ThemeColors.dark : ThemeColors.light;
}
