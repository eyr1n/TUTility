import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/provider/shared_preferences.dart';

@immutable
class SharedPreferencesScope extends ConsumerWidget {
  final Widget child;

  const SharedPreferencesScope({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    return switch (sharedPreferences) {
      AsyncData _ => child,
      _ => const SizedBox.shrink(),
    };
  }
}
