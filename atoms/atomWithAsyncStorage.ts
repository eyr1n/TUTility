import AsyncStorage from '@react-native-async-storage/async-storage';
import { atomWithStorage, createJSONStorage } from 'jotai/utils';

export function atomWithAsyncStorage<T>(key: string, initialValue: T) {
  const storage = createJSONStorage<T>(() => AsyncStorage);
  return atomWithStorage(key, initialValue, storage);
}
