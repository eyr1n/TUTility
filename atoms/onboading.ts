import { z } from 'zod';
import { atomWithAsyncStorage } from './atomWithAsyncStorage';

export const onboadingAtom = atomWithAsyncStorage(
  'onboading',
  false,
  z.boolean(),
);
