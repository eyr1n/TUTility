import { openBrowserAsync } from 'expo-web-browser';
import { List } from 'react-native-paper';

interface LinkListItemProps {
  title: string;
  url: string;
}

export function LinkListItem({ title, url }: LinkListItemProps) {
  return (
    <List.Item
      title={title}
      onPress={async () => {
        await openBrowserAsync(url);
      }}
    />
  );
}
