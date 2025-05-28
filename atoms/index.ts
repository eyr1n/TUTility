import { Timetable } from 'timetable-scraper';
import { z } from 'zod';
import { atomWithAsyncStorage } from './atomWithAsyncStorage';

export const timetableAtom = atomWithAsyncStorage(
  Timetable.nullable(),
  'timetable',
  null,
);

export const termAtom = atomWithAsyncStorage(
  z.enum(['firstHalf', 'secondHalf']),
  'term',
  'firstHalf',
);

export const hideResearchAtom = atomWithAsyncStorage(
  z.boolean(),
  'hide_research',
  false,
);

export const hideInternshipAtom = atomWithAsyncStorage(
  z.boolean(),
  'hide_internship',
  false,
);
