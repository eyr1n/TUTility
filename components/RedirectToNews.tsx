import { hasReadNewsAtom } from '@/atoms/news';
import { useFocusEffect, useRouter } from 'expo-router';
import { useAtom } from 'jotai';
import { Suspense, useCallback } from 'react';

export function RedirectToNews() {
  return (
    <Suspense>
      <RedirectToNewsImpl />
    </Suspense>
  );
}

function RedirectToNewsImpl() {
  const router = useRouter();

  const [hasRead, setRead] = useAtom(hasReadNewsAtom);

  useFocusEffect(
    useCallback(() => {
      if (!hasRead) {
        setRead();
        router.push('/news');
      }
    }, [hasRead, router, setRead]),
  );

  return null;
}
