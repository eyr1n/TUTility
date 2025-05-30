import { onboadingAtom } from '@/atoms/onboading';
import { RedirectToNews } from '@/components/RedirectToNews';
import { ThemeProvider } from '@/components/ThemeProvider';
import { DarkColors, LightColors } from '@/constants/Colors';
import { Redirect, Stack } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import { useAtomValue } from 'jotai';
import { StrictMode } from 'react';
import { Appbar, MD3DarkTheme, MD3LightTheme } from 'react-native-paper';

export default function RootLayout() {
  const materialLight = {
    ...MD3LightTheme,
    colors: LightColors,
  };
  const materialDark = {
    ...MD3DarkTheme,
    colors: DarkColors,
  };

  return (
    <StrictMode>
      <ThemeProvider materialLight={materialLight} materialDark={materialDark}>
        <Stack
          screenOptions={{
            header: ({ navigation, route, options, back }) => (
              <Appbar.Header elevated>
                {back != null && (
                  <Appbar.BackAction onPress={() => navigation.goBack()} />
                )}
                <Appbar.Content title={options.title || route.name} />
              </Appbar.Header>
            ),
          }}
        >
          <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
        </Stack>
        <StatusBar style="auto" />
      </ThemeProvider>
      {/* <Suspense>
        <Redirect2 />
      </Suspense> */}
    </StrictMode>
  );
}

function Redirect2() {
  const onboading = useAtomValue(onboadingAtom);
  return onboading ? <RedirectToNews /> : <Redirect href="/onboading" />;
}
