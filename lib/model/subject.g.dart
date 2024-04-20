// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      id: json['id'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      area: json['area'] as String?,
      required: json['required'] as String?,
      term: json['term'] as String?,
      units: json['units'] as int?,
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
      'required': instance.required,
      'term': instance.term,
      'units': instance.units,
      'grade': instance.grade,
      'staff': instance.staff,
      'room': instance.room,
    };
