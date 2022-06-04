// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TileData _$TileDataFromJson(Map<String, dynamic> json) => TileData(
      id: json['id'] as String,
      name: json['name'] as String,
      area: json['area'] as String,
      term: json['term'] as String,
      required: json['required'] as String,
      units: json['units'] as String,
      grade: json['grade'] as String,
      staff: json['staff'] as String,
      syllabus: json['syllabus'] as String,
      room: json['room'] as String,
    );

Map<String, dynamic> _$TileDataToJson(TileData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'area': instance.area,
      'term': instance.term,
      'required': instance.required,
      'units': instance.units,
      'grade': instance.grade,
      'staff': instance.staff,
      'syllabus': instance.syllabus,
      'room': instance.room,
    };
