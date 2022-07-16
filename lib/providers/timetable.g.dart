// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
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

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
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

Timetable _$TimetableFromJson(Map<String, dynamic> json) => Timetable(
      list: (json['list'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => Subject.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList())
          .toList(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$TimetableToJson(Timetable instance) => <String, dynamic>{
      'list': instance.list,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
