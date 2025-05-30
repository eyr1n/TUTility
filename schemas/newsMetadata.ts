import { z } from 'zod';

export const NewsMetadata = z.object({
  lastUpdated: z.string().optional(),
});

export type NewsMetadata = z.infer<typeof NewsMetadata>;
