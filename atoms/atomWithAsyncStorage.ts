import AsyncStorage from '@react-native-async-storage/async-storage';
import {
  atomWithStorage,
  createJSONStorage,
  unstable_withStorageValidator as withStorageValidator,
} from 'jotai/utils';
import { z, ZodTypeAny } from 'zod';

export function atomWithAsyncStorage<Schema extends ZodTypeAny>(
  schema: Schema,
  key: string,
  initialValue: z.infer<Schema>,
) {
  const storage = withStorageValidator<z.infer<Schema>>(
    (value): value is z.infer<Schema> => schema.safeParse(value).success,
  )(createJSONStorage(() => AsyncStorage));
  return atomWithStorage(key, initialValue, storage);
}
