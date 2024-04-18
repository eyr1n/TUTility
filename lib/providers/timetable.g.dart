// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      id: json['id'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      area: json['area'] as String?,
      term: json['term'] as String?,
      required: json['required'] as String?,
      units: json['units'] as String?,
      grade: json['grade'] as String?,
      staff: json['staff'] as String?,
      room: json['room'] as String?,
    );

Map<String, dynamic> _$$SubjectImplToJson(_$SubjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'area': instance.area,
      'term': instance.term,
      'required': instance.required,
      'units': instance.units,
      'grade': instance.grade,
      'staff': instance.staff,
      'room': instance.room,
    };

_$Timetable2Impl _$$Timetable2ImplFromJson(Map<String, dynamic> json) =>
    _$Timetable2Impl(
      period: json['period'] as int,
      firstOrSecond: json['firstOrSecond'] as int,
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
    );

Map<String, dynamic> _$$Timetable2ImplToJson(_$Timetable2Impl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'firstOrSecond': instance.firstOrSecond,
      'firstHalf': instance.firstHalf,
      'secondHalf': instance.secondHalf,
    };

_$TimetableImpl _$$TimetableImplFromJson(Map<String, dynamic> json) =>
    _$TimetableImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => Subject.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$$TimetableImplToJson(_$TimetableImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
