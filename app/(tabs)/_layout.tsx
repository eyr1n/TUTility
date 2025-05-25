import { MaterialIcons } from '@expo/vector-icons';
import { CommonActions } from '@react-navigation/native';
import { Tabs } from 'expo-router';
import React from 'react';
import { Appbar, BottomNavigation } from 'react-native-paper';

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
      tabBar={({ navigation, state, descriptors, insets }) => (
        <BottomNavigation.Bar
          navigationState={state}
          safeAreaInsets={insets}
          onTabPress={({ route, preventDefault }) => {
            const event = navigation.emit({
              type: 'tabPress',
              target: route.key,
              canPreventDefault: true,
            });

            if (event.defaultPrevented) {
              preventDefault();
            } else {
              navigation.dispatch({
                ...CommonActions.navigate(route.name, route.params),
                target: state.key,
              });
            }
          }}
          renderIcon={({ route, focused, color }) =>
            descriptors[route.key].options.tabBarIcon?.({
              focused,
              color,
              size: 24,
            }) || null
          }
          getLabelText={({ route }) => {
            const { options } = descriptors[route.key];
            const label =
              typeof options.tabBarLabel === 'string'
                ? options.tabBarLabel
                : typeof options.title === 'string'
                  ? options.title
                  : route.name;

            return label;
          }}
        />
      )}
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
