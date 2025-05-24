import { Timetable } from '@/schemas/Timetable';
import { atomWithAsyncStorage } from './atomWithAsyncStorage';

export const timetableAtom = atomWithAsyncStorage<Timetable | null>(
  'timetable',
  null,
);

export const termAtom = atomWithAsyncStorage<'firstHalf' | 'secondHalf'>(
  'term',
  'firstHalf',
);

export const hideResearchAtom = atomWithAsyncStorage('hide_research', false);

export const hideInternshipAtom = atomWithAsyncStorage(
  'hide_internship',
  false,
);
