import { z } from 'zod';

export const NewsMetadataSchema = z.object({
  lastUpdated: z.string().optional(),
});

export type NewsMetadata = z.infer<typeof NewsMetadataSchema>;
