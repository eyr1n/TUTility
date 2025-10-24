import {
  ColorValue,
  OpaqueColorValue,
  Platform,
  PlatformColor
} from 'react-native';

export const DefaultTheme = {
    primary: 'rgb(186, 26, 32)',
    secondary: 'rgb(255, 218, 214)',
    foreground: Platform.select<ColorValue>({
      ios: PlatformColor('label'),
      default: 'rgb(32, 26, 25)',
    }),
    background: Platform.select<ColorValue>({
      ios: PlatformColor('systemBackground'),
      default: 'rgb(255, 251, 255)',
    }),
    secondaryBackground: Platform.select<ColorValue>({
      ios: PlatformColor('secondarySystemBackground'),
      default: 'rgb(251, 238, 236)',
    }),
  } as const;

  export const DarkTheme = {
     primary: 'rgb(255, 179, 172)',
    secondary: 'rgb(147, 0, 16)',
    foreground: Platform.select<OpaqueColorValue | string>({
      ios: PlatformColor('label'),
      default: 'rgb(237, 224, 222)',
    }),
    background: Platform.select<OpaqueColorValue | string>({
      ios: PlatformColor('systemBackground'),
      default: 'rgb(32, 26, 25)',
    }),
    secondaryBackground: Platform.select<OpaqueColorValue | string>({
      ios: PlatformColor('secondarySystemBackground'),
      default: 'rgb(54, 47, 46)',
    }),
  } as const


