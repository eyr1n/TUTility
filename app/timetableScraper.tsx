import { timetableAtom } from '@/atoms';
import { TimetableScraperWebView } from '@/components/TimetableScraperWebView';
import { Subject } from '@/schemas/Subject';
import { Timetable } from '@/schemas/Timetable';
import { Stack, useRouter } from 'expo-router';
import { useSetAtom } from 'jotai';
import { useState } from 'react';
import { View } from 'react-native';
import {
  ActivityIndicator,
  Button,
  Dialog,
  Portal,
  Text,
} from 'react-native-paper';
import { Timetable as ScraperTimetable } from 'timetable-scraper';
import { z } from 'zod';

export default function TimetableScraperScreen() {
  const router = useRouter();

  const setTimetable = useSetAtom(timetableAtom);

  const [scraperState, setScraperState] = useState<
    'loading' | 'successful' | 'failed' | null
  >(null);

  return (
    <>
      <Stack.Screen options={{ title: '時間割の取得' }} />
      <View style={{ flex: 1 }}>
        <TimetableScraperWebView
          onLoad={() => {
            setScraperState('loading');
          }}
          onSuccess={async (timetable) => {
            setTimetable(await replaceWithSyllabus(timetable));
            setScraperState('successful');
          }}
          onFail={() => {
            setScraperState('failed');
          }}
        />
      </View>

      <Portal>
        <Dialog visible={scraperState === 'loading'}>
          <Dialog.Content>
            <ActivityIndicator size="large" />
          </Dialog.Content>
        </Dialog>

        <Dialog
          visible={scraperState === 'successful'}
          onDismiss={() => {
            router.dismiss();
          }}
        >
          <Dialog.Content>
            <Text>時間割の取得が完了しました</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button
              onPress={() => {
                router.dismiss();
              }}
            >
              閉じる
            </Button>
          </Dialog.Actions>
        </Dialog>

        <Dialog
          visible={scraperState === 'failed'}
          onDismiss={() => {
            router.dismiss();
          }}
        >
          <Dialog.Content>
            <Text>時間割の取得時にエラーが発生しました</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button
              onPress={() => {
                router.dismiss();
              }}
            >
              閉じる
            </Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </>
  );
}

async function replaceWithSyllabus(
  timetable: ScraperTimetable,
): Promise<Timetable> {
  try {
    const syllabusJson = await fetch(
      `https://syllabus.opentut.gr.jp/ja/${timetable.year}/all.min.json`,
    );
    const syllabus = await z
      .record(Subject)
      .parseAsync(await syllabusJson.json());

    const replace = (timetable: (Subject | null)[][]) =>
      timetable.map((row) =>
        row.map((subject) =>
          subject != null
            ? subject.id in syllabus
              ? syllabus[subject.id]
              : subject
            : null,
        ),
      );

    return {
      ...timetable,
      firstHalf: replace(timetable.firstHalf),
      secondHalf: replace(timetable.secondHalf),
      intensive: replace(timetable.intensive),
    };
  } catch {
    return timetable;
  }
}
