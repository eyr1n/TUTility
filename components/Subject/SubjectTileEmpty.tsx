import { useThemeColors } from '@/constants/Colors';
import { SubjectTileBase } from './SubjectTileBase';

export function SubjectTileEmpty() {
  const theme = useThemeColors();
  return <SubjectTileBase backgroundColor={theme.secondaryBackground} />;
}
