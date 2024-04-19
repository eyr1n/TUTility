import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutility/providers/shared_preferences.dart';

part 'timetable.freezed.dart';
part 'timetable.g.dart';

@freezed
class Subject with _$Subject {
  const factory Subject({
    required String id,
    required String url,
    required String name,
    String? area,
    String? term,
    String? required,
    String? units,
    String? grade,
    String? staff,
    String? room,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
class Timetable2 with _$Timetable2 {
  const factory Timetable2({
    required int period,
    required int firstOrSecond,
    required List<List<Subject?>> firstHalf,
    required List<List<Subject?>> secondHalf,
  }) = _Timetable2;

  factory Timetable2.fromJson(Map<String, dynamic> json) =>
      _$Timetable2FromJson(json);
}

@freezed
class Timetable with _$Timetable {
  const factory Timetable({
    required List<List<List<Subject>>> list,
  }) = _Timetable;

  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);
}

final timetableProvider = sharedPreferencesProvider<Timetable2?>(
  key: '_timetable',
  defaultValue: null,
  fromJson: Timetable2.fromJson,
  toJson: (value) => value?.toJson(),
);
