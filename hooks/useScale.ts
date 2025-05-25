import { MaxTimetableWidth } from '@/constants/TimetableWidth';
import { useWindowDimensions } from './useWindowDimensions';

const BaseScreenWidth = 360;
const MaxFontScale = 1.5;

export function useScale() {
  const { width } = useWindowDimensions();

  return Math.min(
    Math.min(width, MaxTimetableWidth) / BaseScreenWidth,
    MaxFontScale,
  );
}
