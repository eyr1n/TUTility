import { useTheme } from 'react-native-paper';
import { SubjectTileBase } from './SubjectTileBase';

export function SubjectTileEmpty() {
  const theme = useTheme();

  return <SubjectTileBase backgroundColor={theme.colors.inverseOnSurface} />;
}
