import { LinkListItem } from '@/components/LinkListItem';
import { ScrollView } from 'react-native';
import { List } from 'react-native-paper';

export default function LinksScreen() {
  return (
    <ScrollView style={{ flex: 1 }}>
      <List.Section>
        <List.Subheader>大学公式</List.Subheader>
        <LinkListItem title="大学ホームページ" url="https://www.tut.ac.jp/" />
        <LinkListItem
          title="教務情報システム"
          url="https://kyomu.office.tut.ac.jp/portal/"
        />
        <LinkListItem
          title="休講情報・案内"
          url="https://kyomu.office.tut.ac.jp/portal/Public/Board/BoardList.aspx"
        />
        <LinkListItem title="TUT LMS" url="https://online.cite.tut.ac.jp/" />
        <LinkListItem
          title="バス時刻表 (技科大前)"
          url="https://www.toyotetsu.jp/station/82/P2/"
        />
        <LinkListItem
          title="バス時刻表 (豊橋駅前)"
          url="https://www.toyotetsu.jp/station/1/P2/"
        />
      </List.Section>
      <List.Section>
        <List.Subheader>OpenTUT</List.Subheader>
        <LinkListItem
          title="OpenTUT ホームページ"
          url="https://opentut.gr.jp/"
        />
        <LinkListItem
          title="キャンパスマップ"
          url="https://campus-map.opentut.gr.jp/"
        />
      </List.Section>
      <List.Section>
        <List.Subheader>外部リンク</List.Subheader>
        <LinkListItem
          title="キャンパスコンパス (ぱすぱす)"
          url="https://pus-pass.com/?utm_source=app&utm_medium=link-text&utm_campaign=tutility+&utm_id=111"
        />
      </List.Section>
    </ScrollView>
  );
}
