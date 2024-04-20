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

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timetableNotifierHash() => r'915ec70ef886a2068fb98adcb7862fa601608e6e';

/// See also [TimetableNotifier].
@ProviderFor(TimetableNotifier)
final timetableNotifierProvider =
    AutoDisposeNotifierProvider<TimetableNotifier, Timetable?>.internal(
  TimetableNotifier.new,
  name: r'timetableNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timetableNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimetableNotifier = AutoDisposeNotifier<Timetable?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
