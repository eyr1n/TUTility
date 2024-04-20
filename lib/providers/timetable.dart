import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutility/providers/shared_preferences.dart';

part 'timetable.freezed.dart';
part 'timetable.g.dart';

enum Semester {
  spring('前期'),
  fall('後期'),
  ;

  final String label;

  const Semester(this.label);
}

@freezed
class Subject with _$Subject {
  const factory Subject({
    required String id,
    required String url,
    required String name,
    String? area,
    String? required,
    String? term,
    int? units,
    String? grade,
    String? staff,
    String? room,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
class Timetable with _$Timetable {
  const factory Timetable({
    required int year,
    required String belong,
    required Semester semester,
    required List<List<Subject?>> firstHalf,
    required List<List<Subject?>> secondHalf,
    required List<List<Subject?>> intensive,
  }) = _Timetable;

  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);
}

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
