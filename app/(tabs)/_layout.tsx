import { useThemeColors } from '@/constants/Colors';
import { MaterialIcons } from '@expo/vector-icons';
import {
  Icon,
  Label,
  NativeTabs,
  VectorIcon,
} from 'expo-router/unstable-native-tabs';
import { Platform } from 'react-native';

export default function TabLayout() {
  const theme = useThemeColors();

  return (
    <NativeTabs tintColor={theme.primary}>
      <NativeTabs.Trigger name="(home)">
        <Label>時間割</Label>
        {Platform.select({
          ios: <Icon sf="table.fill" />,
          android: (
            <Icon
              src={<VectorIcon family={MaterialIcons} name="calendar-month" />}
            />
          ),
        })}
      </NativeTabs.Trigger>
      <NativeTabs.Trigger name="canteen">
        <Label>食堂</Label>
        {Platform.select({
          ios: (
            <Icon
              src={<VectorIcon family={MaterialIcons} name="restaurant" />}
            />
          ),
          android: (
            <Icon
              src={<VectorIcon family={MaterialIcons} name="restaurant" />}
            />
          ),
        })}
      </NativeTabs.Trigger>
      <NativeTabs.Trigger name="links">
        <Label>リンク</Label>
        {Platform.select({
          ios: <Icon sf="globe" />,
          android: (
            <Icon src={<VectorIcon family={MaterialIcons} name="language" />} />
          ),
        })}
      </NativeTabs.Trigger>
    </NativeTabs>
  );
}
