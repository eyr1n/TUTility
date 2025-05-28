import { deleteItemAsync, getItemAsync, setItemAsync } from 'expo-secure-store';
import {
  atomWithStorage,
  createJSONStorage,
  unstable_withStorageValidator as withStorageValidator,
} from 'jotai/utils';
import { z, ZodTypeAny } from 'zod';

export function atomWithSecureStore<Schema extends ZodTypeAny>(
  schema: Schema,
  key: string,
  initialValue: z.infer<Schema>,
) {
  const storage = withStorageValidator<z.infer<Schema>>(
    (value): value is z.infer<Schema> => schema.safeParse(value).success,
  )(
    createJSONStorage(() => ({
      getItem: (key: string) => {
        return getItemAsync(key);
      },
      setItem: (key: string, newValue: string) => {
        return setItemAsync(key, newValue);
      },
      removeItem: (key: string) => {
        return deleteItemAsync(key);
      },
    })),
  );
  return atomWithStorage(key, initialValue, storage);
}
