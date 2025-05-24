import {
  DarkTheme as NavigationDarkTheme,
  DefaultTheme as NavigationDefaultTheme,
  ThemeProvider as NavigationThemeProvider,
} from '@react-navigation/native';
import { PropsWithChildren } from 'react';
import { useColorScheme } from 'react-native';
import {
  adaptNavigationTheme,
  MD3DarkTheme,
  MD3LightTheme,
  PaperProvider,
} from 'react-native-paper';
import { MD3Colors } from 'react-native-paper/lib/typescript/types';

interface ThemeProviderProps {
  lightColors?: MD3Colors;
  darkColors?: MD3Colors;
}

export function ThemeProvider({
  lightColors,
  darkColors,
  children,
}: PropsWithChildren<ThemeProviderProps>) {
  const colorScheme = useColorScheme();

  const materialLight = {
    ...MD3LightTheme,
    ...(lightColors ? { colors: lightColors } : {}),
  };

  const materialDark = {
    ...MD3DarkTheme,
    ...(darkColors ? { colors: darkColors } : {}),
  };

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
