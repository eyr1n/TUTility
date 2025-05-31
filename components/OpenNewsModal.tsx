import { doNotShowNewsAtom, hasNewsAtom } from '@/atoms/news';
import { useFocusEffect, useRouter } from 'expo-router';
import { useAtom, useAtomValue } from 'jotai';
import { useCallback } from 'react';

export function OpenNewsModal() {
  const router = useRouter();

  const doNotShowNews = useAtomValue(doNotShowNewsAtom);
  const [hasNews, markNewsAsRead] = useAtom(hasNewsAtom);

  useFocusEffect(
    useCallback(() => {
      if (hasNews) {
        markNewsAsRead();
        if (!doNotShowNews) {
          router.push('/news');
        }
      }
    }, [doNotShowNews, hasNews, markNewsAsRead, router]),
  );

  return null;
}
