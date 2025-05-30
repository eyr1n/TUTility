import { hasReadNewsAtom } from '@/atoms/news';
import { useFocusEffect, useRouter } from 'expo-router';
import { useAtomValue, useSetAtom } from 'jotai';
import { Suspense, useCallback } from 'react';

export function RedirectToNews() {
  return (
    <Suspense>
      <RedirectToNewsImpl />
    </Suspense>
  );
}

function RedirectToNewsImpl() {
  const hasRead = useAtomValue(hasReadNewsAtom);
  return !hasRead && <RedirectToNewsImplImpl />;
}

function RedirectToNewsImplImpl() {
  const router = useRouter();
  const setRead = useSetAtom(hasReadNewsAtom);

  useFocusEffect(
    useCallback(() => {
      setRead();
      router.push('/news');
    }, [router, setRead]),
  );

  return null;
}
