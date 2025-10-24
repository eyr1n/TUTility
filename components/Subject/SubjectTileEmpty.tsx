import { useTheme } from '@/hooks/useTheme';
import { SubjectTileBase } from './SubjectTileBase';

export function SubjectTileEmpty() {
  const theme = useTheme();
  return <SubjectTileBase backgroundColor={theme.secondaryBackground} />;
}
