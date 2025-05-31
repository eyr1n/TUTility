import {
  createContext,
  PropsWithChildren,
  use,
  useCallback,
  useState,
} from 'react';
import { Button, Dialog, Portal, Text } from 'react-native-paper';

const ConfirmDialogContext = createContext<
  ((message: string) => Promise<boolean>) | null
>(null);

export function useConfirmDialog() {
  const confirm = use(ConfirmDialogContext);
  if (confirm == null) {
    throw new Error();
  }
  return confirm;
}

export function ConfirmDialogProvider({ children }: PropsWithChildren) {
  const [state, setState] = useState<{
    message: string;
    resolve: (value: boolean) => void;
  } | null>(null);

  const confirm = useCallback(
    (message: string) =>
      new Promise<boolean>((resolve) => {
        setState({ message, resolve });
      }),
    [],
  );

  const ok = useCallback(() => {
    state?.resolve(true);
    setState(null);
  }, [state]);

  const cancel = useCallback(() => {
    state?.resolve(false);
    setState(null);
  }, [state]);

  return (
    <ConfirmDialogContext value={confirm}>
      {children}
      <Portal>
        <Dialog visible={state != null} onDismiss={cancel}>
          <Dialog.Content>
            <Text>{state?.message}</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={cancel}>キャンセル</Button>
            <Button onPress={ok}>OK</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </ConfirmDialogContext>
  );
}
