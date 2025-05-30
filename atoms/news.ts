import { NewsMetadata } from '@/schemas/newsMetadata';
import { atom } from 'jotai';
import { atomWithAsyncStorage } from './atomWithAsyncStorage';

const lastNewsMetadataAtom = atomWithAsyncStorage(
  'lastNewsMetadata',
  {},
  NewsMetadata,
);

const newsMetadataAtom = atom((get) =>
  fetch('https://opentut.gr.jp/news/metadata.json')
    .then((res) => res.json())
    .then((json) => NewsMetadata.parse(json))
    .catch(() => get(lastNewsMetadataAtom)),
);

export const hasReadNewsAtom = atom(
  async (get) =>
    (await get(newsMetadataAtom)).lastUpdated ===
    (await get(lastNewsMetadataAtom)).lastUpdated,
  async (get, set) => set(lastNewsMetadataAtom, await get(newsMetadataAtom)),
);
