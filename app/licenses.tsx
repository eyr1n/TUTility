import licenses from '@/assets/licenses.json';
import { ThemedText } from '@/components/ThemedText';
import { useThemeColors } from '@/constants/Colors';
import { Stack } from 'expo-router';
import { openBrowserAsync } from 'expo-web-browser';
import { FlatList, TouchableOpacity, useColorScheme, View } from 'react-native';

function Card({
  children,
  onPress,
}: {
  children: React.ReactNode;
  onPress?: () => void;
}) {
  const theme = useThemeColors();
  const colorScheme = useColorScheme();

  return (
    <TouchableOpacity onPress={onPress} disabled={onPress == null}>
      <View
        style={{
          borderRadius: 16,
          padding: 16,
          //shadowColor: '#000',
          //shadowOffset: { width: 0, height: 2 },
          //shadowOpacity: 0.1,
          //shadowRadius: 4,
          //elevation: 2,
          gap: 8,
          backgroundColor:
            colorScheme === 'dark'
              ? theme.secondaryBackground
              : theme.background,
        }}
      >
        {children}
      </View>
    </TouchableOpacity>
  );
}

export default function LicensesScreen() {
  return (
    <>
      <Stack.Screen options={{ title: 'ライセンス' }} />
      <FlatList
        contentContainerStyle={{ padding: 16 }}
        data={Object.entries(licenses)}
        renderItem={({ item }) => (
          <Card
            onPress={
              'repository' in item[1]
                ? async () => {
                    if ('repository' in item[1]) {
                      await openBrowserAsync(item[1].repository);
                    }
                  }
                : undefined
            }
          >
            <ThemedText style={{ fontSize: 18 }}>{item[0]}</ThemedText>
            <ThemedText>License: {item[1].licenses}</ThemedText>
            {'publisher' in item[1] && (
              <ThemedText>Publisher: {item[1].publisher}</ThemedText>
            )}
            {'copyright' in item[1] && item[1].copyright != null && (
              <ThemedText>{item[1].copyright}</ThemedText>
            )}
          </Card>
        )}
        keyExtractor={(item) => item[0]}
        ItemSeparatorComponent={() => <View style={{ height: 16 }} />}
      />
    </>
  );
}
