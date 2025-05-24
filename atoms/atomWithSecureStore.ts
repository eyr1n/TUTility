import { deleteItemAsync, getItemAsync, setItemAsync } from 'expo-secure-store';
import { atomWithStorage, createJSONStorage } from 'jotai/utils';

export function atomWithSecureStore<T>(key: string, initialValue: T) {
  const storage = createJSONStorage<T>(() => ({
    getItem: (key: string) => {
      return getItemAsync(key);
    },
    setItem: (key: string, newValue: string) => {
      return setItemAsync(key, newValue);
    },
    removeItem: (key: string) => {
      return deleteItemAsync(key);
    },
  }));
  return atomWithStorage(key, initialValue, storage);
}
