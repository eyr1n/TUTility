import { PlatformColor, useColorScheme } from 'react-native';

export const ThemeColors = {
  light: {
    tut: 'rgb(186, 26, 32)',
    primary: 'rgb(186, 26, 32)',
    primaryContainer: 'rgb(255, 218, 214)',
    text: PlatformColor('label'),
    background: PlatformColor('systemBackground'),
    secondaryBackground: PlatformColor('secondarySystemBackground'),
  },
  dark: {
    tut: 'rgb(186, 26, 32)',
    primary: 'rgb(255, 179, 172)',
    primaryContainer: 'rgb(147, 0, 16)',
    text: PlatformColor('label'),
    background: PlatformColor('systemBackground'),
    secondaryBackground: PlatformColor('secondarySystemBackground'),
  },
} as const;

export function useThemeColors() {
  const colorScheme = useColorScheme();
  return colorScheme === 'dark' ? ThemeColors.dark : ThemeColors.light;
}
