import { useTheme } from '@/hooks/useTheme';
import { MaterialIcons } from '@expo/vector-icons';
import {
  Icon,
  Label,
  NativeTabs,
  VectorIcon,
} from 'expo-router/unstable-native-tabs';

export default function TabLayout() {
  const theme = useTheme();

  return (
    <NativeTabs tintColor={theme.primary}>
      <NativeTabs.Trigger name="(home)">
        <Label>時間割</Label>
        <Icon sf="table.fill" />
      </NativeTabs.Trigger>
      <NativeTabs.Trigger name="canteen">
        <Label>食堂</Label>
        <Icon src={<VectorIcon family={MaterialIcons} name="restaurant" />} />
      </NativeTabs.Trigger>
      <NativeTabs.Trigger name="links">
        <Label>リンク</Label>
        <Icon sf="globe" />
      </NativeTabs.Trigger>
    </NativeTabs>
  );
}
