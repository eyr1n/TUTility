import { z } from 'zod';
import { Subject } from './subject';

export const Timetable = z.object({
  year: z.string(),
  belong: z.string(),
  semester: z.enum(['spring', 'fall']),
  firstHalf: z.array(z.array(z.nullable(Subject))),
  secondHalf: z.array(z.array(z.nullable(Subject))),
  intensive: z.array(z.array(z.nullable(Subject))),
});

export type Timetable = z.infer<typeof Timetable>;
