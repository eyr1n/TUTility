import { DarkTheme, DefaultTheme } from "@/constants/Theme";
import { useColorScheme } from "react-native";

export function useTheme() {
  const colorScheme = useColorScheme();
  return colorScheme === 'dark' ? DarkTheme : DefaultTheme;
}