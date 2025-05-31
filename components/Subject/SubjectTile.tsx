import { Palette } from '@/constants/Palette';
import { useScale } from '@/hooks/useScale';
import { openBrowserAsync } from 'expo-web-browser';
import { useState } from 'react';
import { View } from 'react-native';
import {
  Button,
  Dialog,
  MD3LightTheme,
  Portal,
  Text,
} from 'react-native-paper';
import { Subject } from 'timetable-scraper';
import { SubjectTileBase } from './SubjectTileBase';

interface SubjectTileProps {
  subject: Subject;
}

export function SubjectTile({ subject }: SubjectTileProps) {
  const scale = useScale();

  const [showDetail, setShowDetail] = useState(false);

  const { backgroundColor, borderColor } =
    Palette[paletteIndexFromSubjectId(subject.id)];

  return (
    <>
      <SubjectTileBase
        backgroundColor={backgroundColor}
        borderColor={borderColor}
        onPress={() => {
          setShowDetail(true);
        }}
      >
        <View style={{ flex: 1, padding: 2 }}>
          <Text
            style={{
              fontSize: 12 * scale,
              lineHeight: 1.2 * 12 * scale,
              textAlign: 'center',
              color: MD3LightTheme.colors.onSurface,
            }}
            numberOfLines={3}
          >
            {subject.name}
          </Text>
        </View>
        {subject.room && (
          <View
            style={{
              height: 22 * scale,
              justifyContent: 'center',
              backgroundColor: borderColor,
            }}
          >
            <Text
              style={{
                fontSize: 11 * scale,
                textAlign: 'center',
                color: MD3LightTheme.colors.onSurface,
              }}
              numberOfLines={1}
            >
              {subject.room}
            </Text>
          </View>
        )}
      </SubjectTileBase>

      <Portal>
        <Dialog
          visible={showDetail}
          onDismiss={() => {
            setShowDetail(false);
          }}
        >
          <Dialog.Title>{subject.name}</Dialog.Title>
          <Dialog.Content>
            <Text>
              {subject.term} {subject.required}
            </Text>
            {subject.units && <Text>単位数: {subject.units}</Text>}
            {subject.area && <Text>区分: {subject.area}</Text>}
            {subject.staff && <Text>担当教員: {subject.staff}</Text>}
            {subject.room && <Text>教室: {subject.room}</Text>}
          </Dialog.Content>
          <Dialog.Actions>
            <Button
              onPress={async () => {
                await openBrowserAsync(subject.url);
              }}
            >
              シラバス
            </Button>
            <Button
              onPress={() => {
                setShowDetail(false);
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

function paletteIndexFromSubjectId(id: string) {
  const data = new TextEncoder().encode(id);
  return data.reduce((acc, cur) => acc + cur) % Palette.length;
}
