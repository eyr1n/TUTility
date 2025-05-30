import { Timetable } from 'timetable-scraper';
import { z } from 'zod';
import { atomWithAsyncStorage } from './atomWithAsyncStorage';

export const timetableAtom = atomWithAsyncStorage(
  'timetable',
  null,
  Timetable.nullable(),
);

export const termAtom = atomWithAsyncStorage(
  'term',
  'firstHalf',
  z.enum(['firstHalf', 'secondHalf']),
);

export const hideResearchAtom = atomWithAsyncStorage(
  'hideResearch',
  false,
  z.boolean(),
);

export const hideInternshipAtom = atomWithAsyncStorage(
  'hideInternship',
  false,
  z.boolean(),
);
