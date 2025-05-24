import { z } from 'zod';

export const Subject = z.object({
  id: z.string(),
  url: z.string(),
  name: z.string(),
  area: z.string().nullable().optional(),
  required: z.string().nullable().optional(),
  term: z.string().nullable().optional(),
  units: z.string().nullable().optional(),
  grade: z.string().nullable().optional(),
  staff: z.string().nullable().optional(),
  room: z.string().nullable().optional(),
});

export type Subject = z.infer<typeof Subject>;
