import { ThemeProvider } from '@/components/ThemeProvider';
import { DarkColors, LightColors } from '@/constants/Colors';
import { Stack } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import { StrictMode, Suspense } from 'react';
import { Appbar } from 'react-native-paper';

export default function RootLayout() {
  return (
    <StrictMode>
      <Suspense>
        <ThemeProvider lightColors={LightColors} darkColors={DarkColors}>
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
      </Suspense>
    </StrictMode>
  );
}
