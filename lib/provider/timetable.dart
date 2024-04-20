import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutility/model/timetable.dart';
import 'package:tutility/provider/shared_preferences.dart';

part 'timetable.g.dart';

@riverpod
class TimetableNotifier extends _$TimetableNotifier {
  late SharedPreferences _sharedPreferences;

  @override
  Timetable? build() {
    _sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
    try {
      final str = _sharedPreferences.getString('timetable');
      return str != null ? Timetable.fromJson(jsonDecode(str)) : null;
    } catch (_) {
      return null;
    }
  }

  Future<bool> set(Timetable? value) {
    state = value;
    return _sharedPreferences.setString(
        'timetable', jsonEncode(value?.toJson()));
  }
}
