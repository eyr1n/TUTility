import { alertDialogAtom } from '@/atoms/dialog';
import { useSetAtom } from 'jotai';
import { useCallback } from 'react';

export function useAlertDialog() {
  const setAlertDialog = useSetAtom(alertDialogAtom);

  const alert = useCallback(
    (message: string) =>
      new Promise<void>((resolve) => {
        setAlertDialog({ message, resolve });
      }),
    [setAlertDialog],
  );

  return alert;
}
