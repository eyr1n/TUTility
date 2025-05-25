import {
  DarkTheme as NavigationDarkTheme,
  DefaultTheme as NavigationDefaultTheme,
  ThemeProvider as NavigationThemeProvider,
} from '@react-navigation/native';
import { PropsWithChildren } from 'react';
import { useColorScheme } from 'react-native';
import {
  adaptNavigationTheme,
  MD3Theme,
  PaperProvider,
} from 'react-native-paper';

interface ThemeProviderProps {
  materialLight?: MD3Theme;
  materialDark?: MD3Theme;
}

export function ThemeProvider({
  materialLight,
  materialDark,
  children,
}: PropsWithChildren<ThemeProviderProps>) {
  const colorScheme = useColorScheme();

  const { LightTheme, DarkTheme } = adaptNavigationTheme({
    reactNavigationLight: NavigationDefaultTheme,
    reactNavigationDark: NavigationDarkTheme,
    materialLight,
    materialDark,
  });

  return (
    <PaperProvider
      theme={colorScheme === 'dark' ? materialDark : materialLight}
    >
      <NavigationThemeProvider
        value={colorScheme === 'dark' ? DarkTheme : LightTheme}
      >
        {children}
      </NavigationThemeProvider>
    </PaperProvider>
  );
}
