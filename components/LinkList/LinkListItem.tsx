import { Button } from '@expo/ui/swift-ui';
import { openBrowserAsync } from 'expo-web-browser';

interface LinkListItemProps {
  title: string;
  url: string;
}

export function LinkListItem({ title, url }: LinkListItemProps) {
  return (
    <Button
      onPress={async () => {
        await openBrowserAsync(url);
      }}
      color="primary"
    >
      {title}
    </Button>
  );
}
