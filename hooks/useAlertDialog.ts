import { Alert } from 'react-native';

export function useAlertDialog() {
  function alert(message: string) {
    return new Promise<void>((resolve) => {
      Alert.alert(
        '',
        message,
        [
          {
            text: '閉じる',
            onPress: () => resolve(),
            style: 'default',
          },
        ],
        {
          onDismiss: () => resolve(),
        },
      );
    });
  }

  return alert;
}
