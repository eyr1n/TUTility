import { alertDialogAtom } from '@/atoms/dialog';
import { useAtom } from 'jotai';
import { useCallback } from 'react';
import { Button, Dialog, Portal, Text } from 'react-native-paper';

export function AlertDialog() {
  const [alertDialog, setAlertDialog] = useAtom(alertDialogAtom);

  const close = useCallback(() => {
    alertDialog?.resolve();
    setAlertDialog(null);
  }, [alertDialog, setAlertDialog]);

  return (
    <Portal>
      <Dialog visible={alertDialog != null} onDismiss={close}>
        <Dialog.Content>
          <Text>{alertDialog?.message}</Text>
        </Dialog.Content>
        <Dialog.Actions>
          <Button onPress={close}>閉じる</Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  );
}
