import { confirmDialogAtom } from '@/atoms/dialog';
import { useSetAtom } from 'jotai';
import { useCallback } from 'react';

export function useConfirmDialog() {
  const setConfirmDialog = useSetAtom(confirmDialogAtom);

  const confirm = useCallback(
    (message: string) =>
      new Promise<boolean>((resolve) => {
        setConfirmDialog({ message, resolve });
      }),
    [setConfirmDialog],
  );

  return confirm;
}
