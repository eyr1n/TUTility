import licenses from '@/assets/licenses.json';
import { Stack } from 'expo-router';
import { openBrowserAsync } from 'expo-web-browser';
import { FlatList, View } from 'react-native';
import { Card, Text } from 'react-native-paper';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function LicensesScreen() {
  return (
    <>
      <Stack.Screen options={{ title: 'ライセンス' }} />
      <SafeAreaView style={{ flex: 1 }} edges={['bottom']}>
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
              <Card.Title title={item[0]} subtitle={item[1].licenses} />
              <Card.Content>
                {'publisher' in item[1] ? (
                  <Text>{item[1].publisher}</Text>
                ) : null}
                {'copyright' in item[1] && item[1].copyright !== null ? (
                  <Text>{item[1].copyright}</Text>
                ) : null}
              </Card.Content>
            </Card>
          )}
          keyExtractor={(item) => item[0]}
          ItemSeparatorComponent={() => <View style={{ height: 16 }} />}
        />
      </SafeAreaView>
    </>
  );
}
