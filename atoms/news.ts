import { NewsMetadataSchema } from '@/schemas/newsMetadata';
import { atom } from 'jotai';
import { z } from 'zod';
import { atomWithAsyncStorage } from './atomWithAsyncStorage';

const lastNewsMetadataAtom = atomWithAsyncStorage(
  'lastNewsMetadata',
  {},
  NewsMetadataSchema,
);

const newsMetadataAtom = atom((get) =>
  fetch('https://opentut.gr.jp/news/metadata.json')
    .then((res) => res.json())
    .then((json) => NewsMetadataSchema.parse(json))
    .catch(() => get(lastNewsMetadataAtom)),
);

export const hasNewsAtom = atom(
  async (get) =>
    (await get(newsMetadataAtom)).lastUpdated !==
    (await get(lastNewsMetadataAtom)).lastUpdated,
  async (get, set) => set(lastNewsMetadataAtom, await get(newsMetadataAtom)),
);

export const doNotShowNewsAtom = atomWithAsyncStorage(
  'doNotShowNews',
  false,
  z.boolean(),
);
