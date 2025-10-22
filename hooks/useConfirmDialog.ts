import { Alert } from 'react-native';

export function useConfirmDialog() {

  function confirm(message: string) {
    return new Promise<boolean>((resolve) => {
      Alert.alert(
        '',
        message,
        [
          {
            text: 'OK',
            onPress: () => resolve(true),
            style: 'destructive',
          },
          {
            text: 'キャンセル',
            onPress: () => resolve(false),
            style: 'cancel',
          },
        ],
        {
          onDismiss: () => resolve(false),
        },
      );
    });
  }

  return confirm;
}
