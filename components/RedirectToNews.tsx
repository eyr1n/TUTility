import { doNotShowAgainNewsAtom, hasReadNewsAtom } from '@/atoms/news';
import { useFocusEffect, useRouter } from 'expo-router';
import { useAtom, useAtomValue } from 'jotai';
import { useCallback } from 'react';

export function RedirectToNews() {
  const router = useRouter();

  const [hasRead, setRead] = useAtom(hasReadNewsAtom);
  const doNotShowAgainNews = useAtomValue(doNotShowAgainNewsAtom);

  useFocusEffect(
    useCallback(() => {
      if (!doNotShowAgainNews && !hasRead) {
        setRead();
        router.push('/news');
      }
    }, [doNotShowAgainNews, hasRead, router, setRead]),
  );

  return null;
}
