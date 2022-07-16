// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_visibility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimetableVisibility _$TimetableVisibilityFromJson(Map<String, dynamic> json) =>
    TimetableVisibility(
      list: (json['list'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as int?).toList())
          .toList(),
    );

Map<String, dynamic> _$TimetableVisibilityToJson(
        TimetableVisibility instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
