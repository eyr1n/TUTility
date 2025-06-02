import { termAtom, timetableAtom } from '@/atoms/timetable';
import { OpenNewsScreen } from '@/components/OpenNewsScreen';
import { Timetable } from '@/components/Timetable/Timetable';
import { base32 } from '@/totp/base32';
import { PayloadSchema } from '@/totp/migration_pb';
import { fromBinary } from '@bufbuild/protobuf';
import { base64Decode } from '@bufbuild/protobuf/wire';
import { Stack, useRouter } from 'expo-router';
import { useAtom, useAtomValue } from 'jotai';
import { Suspense } from 'react';
import { ScrollView, View } from 'react-native';
import { Appbar, SegmentedButtons, Text } from 'react-native-paper';

export default function TimetableScreen() {
  const router = useRouter();

  const timetable = useAtomValue(timetableAtom);
  const [term, setTerm] = useAtom(termAtom);

  const termLabel = timetable?.term === 'spring' ? '前期' : '後期';
  const firstOrSecond =
    term === 'firstHalf' ? timetable?.firstHalf : timetable?.secondHalf;

  return (
    <>
      <Stack.Screen
        options={{
          header: () => (
            <Appbar.Header mode="center-aligned">
              <Appbar.Content
                title={
                  timetable != null && (
                    <SegmentedButtons
                      value={term}
                      onValueChange={setTerm}
                      buttons={[
                        {
                          value: 'firstHalf',
                          label: `${termLabel}1`,
                          style: { flex: 0 },
                        },
                        {
                          value: 'secondHalf',
                          label: `${termLabel}2`,
                          style: { flex: 0 },
                        },
                      ]}
                    />
                  )
                }
              />
              <Appbar.Action
                icon="download"
                onPress={() => {
                  router.push('/timetableScraper');
                }}
              />
            </Appbar.Header>
          ),
        }}
      />
      {firstOrSecond ? (
        <ScrollView
          style={{ flex: 1 }}
          contentContainerStyle={{ alignItems: 'center', padding: 8 }}
        >
          <Timetable timetable={firstOrSecond} />
        </ScrollView>
      ) : (
        <View
          style={{
            flex: 1,
            justifyContent: 'center',
            alignItems: 'center',
            padding: 8,
          }}
        >
          <Text style={{ textAlign: 'center' }}>
            右上のボタンから時間割を取得できます
          </Text>
        </View>
      )}
      <Suspense>
        <OpenNewsScreen />
      </Suspense>
    </>
  );
}

const otpauthMigrationUrl = new URL('otpauth-migration://offline?data=');
const dataBase64 = otpauthMigrationUrl.searchParams.get('data');
if (dataBase64) {
  const data = base64Decode(decodeURIComponent(dataBase64));
  const payload = fromBinary(PayloadSchema, data);
  console.log(payload);
  const secret = payload.parameters[0].secret;
  console.log(secret);

  const secret_exact = base32('');
  console.log(secret_exact);
}
