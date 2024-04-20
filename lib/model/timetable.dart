import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutility/model/semester.dart';
import 'package:tutility/model/subject.dart';

part 'timetable.freezed.dart';
part 'timetable.g.dart';

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
