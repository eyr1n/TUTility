import {
  createContext,
  PropsWithChildren,
  use,
  useCallback,
  useState,
} from 'react';
import { Button, Dialog, Portal, Text } from 'react-native-paper';

const AlertDialogContext = createContext<
  ((message: string) => Promise<void>) | null
>(null);

export function useAlertDialog() {
  const alert = use(AlertDialogContext);
  if (alert == null) {
    throw new Error();
  }
  return alert;
}

export function AlertDialogProvider({ children }: PropsWithChildren) {
  const [state, setState] = useState<{
    message: string;
    resolve: () => void;
  } | null>(null);

  const alert = useCallback(
    (message: string) =>
      new Promise<void>((resolve) => {
        setState({ message, resolve });
      }),
    [],
  );

  const close = useCallback(() => {
    state?.resolve();
    setState(null);
  }, [state]);

  return (
    <AlertDialogContext value={alert}>
      {children}
      <Portal>
        <Dialog visible={state != null} onDismiss={close}>
          <Dialog.Content>
            <Text>{state?.message}</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={close}>閉じる</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </AlertDialogContext>
  );
}
