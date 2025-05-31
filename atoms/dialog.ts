import { atom } from 'jotai';

export const alertDialogAtom = atom<{
  message: string;
  resolve: () => void;
} | null>(null);

export const confirmDialogAtom = atom<{
  message: string;
  resolve: (value: boolean) => void;
} | null>(null);
