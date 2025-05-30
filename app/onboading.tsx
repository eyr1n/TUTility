import { onboadingAtom } from '@/atoms/onboading';
import { Stack, useRouter } from 'expo-router';
import { useSetAtom } from 'jotai';
import { Button } from 'react-native-paper';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function OnboadingScreen() {
  const router = useRouter();

  const setOnboading = useSetAtom(onboadingAtom);

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
