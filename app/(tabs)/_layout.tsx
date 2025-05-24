import { BottomTabBar } from '@/components/BottomTabBar';
import { MaterialIcons } from '@expo/vector-icons';
import { Tabs } from 'expo-router';
import React from 'react';
import { Appbar } from 'react-native-paper';

export default function TabLayout() {
  return (
    <Tabs
      screenOptions={{
        header: ({ route, options }) => (
          <Appbar.Header elevated>
            <Appbar.Content title={options.title || route.name} />
          </Appbar.Header>
        ),
      }}
      tabBar={BottomTabBar}
    >
      <Tabs.Screen
        name="index"
        options={{
          title: '時間割',
          tabBarIcon: ({ color, size }) => (
            <MaterialIcons name="calendar-month" color={color} size={size} />
          ),
        }}
      />
      <Tabs.Screen
        name="canteen"
        options={{
          title: '食堂メニュー',
          tabBarLabel: '食堂',
          tabBarIcon: ({ color, size }) => (
            <MaterialIcons name="restaurant" color={color} size={size} />
          ),
        }}
      />
      <Tabs.Screen
        name="links"
        options={{
          title: 'リンク',
          tabBarIcon: ({ color, size }) => (
            <MaterialIcons name="language" color={color} size={size} />
          ),
        }}
      />
      <Tabs.Screen
        name="misc"
        options={{
          title: 'その他',
          tabBarIcon: ({ color, size }) => (
            <MaterialIcons name="more-horiz" color={color} size={size} />
          ),
        }}
      />
    </Tabs>
  );
}
