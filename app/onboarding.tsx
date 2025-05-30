import { onboardingAtom } from '@/atoms/onboarding';
import { Stack, useRouter } from 'expo-router';
import { useSetAtom } from 'jotai';
import { Suspense } from 'react';
import { Button } from 'react-native-paper';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function OnboardingScreen() {
  return (
    <Suspense>
      <OnboardingScreenImpl />
    </Suspense>
  );
}

function OnboardingScreenImpl() {
  const router = useRouter();

  const setOnboading = useSetAtom(onboardingAtom);

  return (
    <>
      <Stack.Screen options={{ title: 'ようこそ' }} />
      <SafeAreaView style={{ flex: 1 }} edges={['bottom']}>
        <Button
          onPress={() => {
            setOnboading(true);
            router.replace('/');
          }}
        >
          はじめる
        </Button>
      </SafeAreaView>
    </>
  );
}
