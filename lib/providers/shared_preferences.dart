import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> _sharedPreferences(_SharedPreferencesRef ref) =>
    SharedPreferences.getInstance();

class SharedPreferencesScope extends ConsumerWidget {
  final Widget child;

  const SharedPreferencesScope({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPreferences = ref.watch(_sharedPreferencesProvider);
    switch (sharedPreferences) {
      case AsyncData _:
        return child;
      default:
        return const SizedBox.shrink();
    }
  }
}

class SharedPreferencesNotifier<T> extends Notifier<T> {
  final String key;
  final T defaultValue;
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic>? Function(T) toJson;

  late SharedPreferences prefs;

  SharedPreferencesNotifier({
    required this.key,
    required this.defaultValue,
    required this.fromJson,
    required this.toJson,
  });

  @override
  T build() {
    prefs = ref.watch(_sharedPreferencesProvider).requireValue;
    try {
      final str = prefs.getString(key);
      return str != null ? fromJson(jsonDecode(str)) : defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  Future<bool> set(T value) {
    state = value;
    return prefs.setString(key, jsonEncode(toJson(value)));
  }
}

NotifierProvider<SharedPreferencesNotifier<T>, T> sharedPreferencesProvider<T>({
  required String key,
  required T defaultValue,
  required T Function(Map<String, dynamic>) fromJson,
  required Map<String, dynamic>? Function(T) toJson,
}) =>
    NotifierProvider<SharedPreferencesNotifier<T>, T>(
      () => SharedPreferencesNotifier<T>(
        key: key,
        defaultValue: defaultValue,
        fromJson: fromJson,
        toJson: toJson,
      ),
    );
