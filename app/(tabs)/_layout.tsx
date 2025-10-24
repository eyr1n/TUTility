import { useTheme } from '@/hooks/useTheme';
import { MaterialIcons } from '@expo/vector-icons';
import { Tabs } from 'expo-router';
import React from 'react';

export default function TabLayout() {
  const theme = useTheme();

  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarActiveTintColor: theme.primary,
      }}
    >
      <Tabs.Screen
        name="(home)"
        options={{
          tabBarLabel: '時間割',
          tabBarIcon: ({ color, size }) => (
            <MaterialIcons
              name="calendar-view-month"
              color={color}
              size={size}
            />
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
    </Tabs>
  );
}
