// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimetableImpl _$$TimetableImplFromJson(Map<String, dynamic> json) =>
    _$TimetableImpl(
      year: json['year'] as int,
      belong: json['belong'] as String,
      semester: $enumDecode(_$SemesterEnumMap, json['semester']),
      firstHalf: (json['firstHalf'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => e == null
                  ? null
                  : Subject.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      secondHalf: (json['secondHalf'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => e == null
                  ? null
                  : Subject.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      intensive: (json['intensive'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => e == null
                  ? null
                  : Subject.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$$TimetableImplToJson(_$TimetableImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'belong': instance.belong,
      'semester': _$SemesterEnumMap[instance.semester]!,
      'firstHalf': instance.firstHalf,
      'secondHalf': instance.secondHalf,
      'intensive': instance.intensive,
    };

const _$SemesterEnumMap = {
  Semester.spring: 'spring',
  Semester.fall: 'fall',
};
