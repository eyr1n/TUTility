import { confirmDialogAtom } from '@/atoms/dialog';
import { useAtom } from 'jotai';
import { useCallback } from 'react';
import { Button, Dialog, Portal, Text } from 'react-native-paper';

export function ConfirmDialog() {
  const [confirmDialog, setConfirmDialog] = useAtom(confirmDialogAtom);

  const ok = useCallback(() => {
    confirmDialog?.resolve(true);
    setConfirmDialog(null);
  }, [confirmDialog, setConfirmDialog]);

  const cancel = useCallback(() => {
    confirmDialog?.resolve(false);
    setConfirmDialog(null);
  }, [confirmDialog, setConfirmDialog]);

  return (
    <Portal>
      <Dialog visible={confirmDialog != null} onDismiss={cancel}>
        <Dialog.Content>
          <Text>{confirmDialog?.message}</Text>
        </Dialog.Content>
        <Dialog.Actions>
          <Button onPress={cancel}>キャンセル</Button>
          <Button onPress={ok}>OK</Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  );
}
