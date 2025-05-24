import { openBrowserAsync } from 'expo-web-browser';
import { FlatList, View } from 'react-native';
import { Divider, List } from 'react-native-paper';

interface Link {
  title: string;
  url: string;
}

const links: Link[] = [
  { title: '大学ホームページ', url: 'https://www.tut.ac.jp/' },
  { title: '教務情報システム', url: 'https://kyomu.office.tut.ac.jp/portal/' },
  {
    title: '休講情報・案内',
    url: 'https://kyomu.office.tut.ac.jp/portal/Public/Board/BoardList.aspx',
  },
  { title: 'TUT LMS', url: 'https://lms.imc.tut.ac.jp/login/index.php' },
  {
    title: 'キャンパスマップ',
    url: 'https://www.tut.ac.jp/about/overview/docs/202310map.pdf',
  },
  {
    title: 'バス時刻表 (技科大前)',
    url: 'https://www.toyotetsu.jp/station/82/P2/',
  },
  {
    title: 'バス時刻表 (豊橋駅前)',
    url: 'https://www.toyotetsu.jp/station/1/P2/',
  },
];

export default function LinksScreen() {
  return (
    <View style={{ flex: 1 }}>
      <FlatList
        data={links}
        renderItem={({ item }) => (
          <List.Item
            title={item.title}
            onPress={async () => {
              await openBrowserAsync(item.url);
            }}
          />
        )}
        keyExtractor={(item) => item.title}
        ItemSeparatorComponent={() => <Divider />}
      />
    </View>
  );
}
