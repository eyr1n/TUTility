import { Href, useFocusEffect, useRouter } from 'expo-router';
import { useCallback } from 'react';

interface RedirectWithActionProps {
  href: Href;
  action: () => void;
}

export function RedirectWithAction({ href, action }: RedirectWithActionProps) {
  const router = useRouter();

  useFocusEffect(
    useCallback(() => {
      action();
      router.push(href);
    }, [action, href, router]),
  );

  return null;
}
