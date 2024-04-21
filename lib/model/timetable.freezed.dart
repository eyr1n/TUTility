// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return _Timetable.fromJson(json);
}

/// @nodoc
mixin _$Timetable {
  String get year => throw _privateConstructorUsedError;
  String get belong => throw _privateConstructorUsedError;
  Semester get semester => throw _privateConstructorUsedError;
  List<List<Subject?>> get firstHalf => throw _privateConstructorUsedError;
  List<List<Subject?>> get secondHalf => throw _privateConstructorUsedError;
  List<List<Subject?>> get intensive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableCopyWith<Timetable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableCopyWith<$Res> {
  factory $TimetableCopyWith(Timetable value, $Res Function(Timetable) then) =
      _$TimetableCopyWithImpl<$Res, Timetable>;
  @useResult
  $Res call(
      {String year,
      String belong,
      Semester semester,
      List<List<Subject?>> firstHalf,
      List<List<Subject?>> secondHalf,
      List<List<Subject?>> intensive});
}

/// @nodoc
class _$TimetableCopyWithImpl<$Res, $Val extends Timetable>
    implements $TimetableCopyWith<$Res> {
  _$TimetableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? belong = null,
    Object? semester = null,
    Object? firstHalf = null,
    Object? secondHalf = null,
    Object? intensive = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      belong: null == belong
          ? _value.belong
          : belong // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester,
      firstHalf: null == firstHalf
          ? _value.firstHalf
          : firstHalf // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
      secondHalf: null == secondHalf
          ? _value.secondHalf
          : secondHalf // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
      intensive: null == intensive
          ? _value.intensive
          : intensive // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimetableImplCopyWith<$Res>
    implements $TimetableCopyWith<$Res> {
  factory _$$TimetableImplCopyWith(
          _$TimetableImpl value, $Res Function(_$TimetableImpl) then) =
      __$$TimetableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String year,
      String belong,
      Semester semester,
      List<List<Subject?>> firstHalf,
      List<List<Subject?>> secondHalf,
      List<List<Subject?>> intensive});
}

/// @nodoc
class __$$TimetableImplCopyWithImpl<$Res>
    extends _$TimetableCopyWithImpl<$Res, _$TimetableImpl>
    implements _$$TimetableImplCopyWith<$Res> {
  __$$TimetableImplCopyWithImpl(
      _$TimetableImpl _value, $Res Function(_$TimetableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? belong = null,
    Object? semester = null,
    Object? firstHalf = null,
    Object? secondHalf = null,
    Object? intensive = null,
  }) {
    return _then(_$TimetableImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      belong: null == belong
          ? _value.belong
          : belong // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester,
      firstHalf: null == firstHalf
          ? _value._firstHalf
          : firstHalf // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
      secondHalf: null == secondHalf
          ? _value._secondHalf
          : secondHalf // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
      intensive: null == intensive
          ? _value._intensive
          : intensive // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimetableImpl implements _Timetable {
  const _$TimetableImpl(
      {required this.year,
      required this.belong,
      required this.semester,
      required final List<List<Subject?>> firstHalf,
      required final List<List<Subject?>> secondHalf,
      required final List<List<Subject?>> intensive})
      : _firstHalf = firstHalf,
        _secondHalf = secondHalf,
        _intensive = intensive;

  factory _$TimetableImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableImplFromJson(json);

  @override
  final String year;
  @override
  final String belong;
  @override
  final Semester semester;
  final List<List<Subject?>> _firstHalf;
  @override
  List<List<Subject?>> get firstHalf {
    if (_firstHalf is EqualUnmodifiableListView) return _firstHalf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firstHalf);
  }

  final List<List<Subject?>> _secondHalf;
  @override
  List<List<Subject?>> get secondHalf {
    if (_secondHalf is EqualUnmodifiableListView) return _secondHalf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondHalf);
  }

  final List<List<Subject?>> _intensive;
  @override
  List<List<Subject?>> get intensive {
    if (_intensive is EqualUnmodifiableListView) return _intensive;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intensive);
  }

  @override
  String toString() {
    return 'Timetable(year: $year, belong: $belong, semester: $semester, firstHalf: $firstHalf, secondHalf: $secondHalf, intensive: $intensive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimetableImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.belong, belong) || other.belong == belong) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            const DeepCollectionEquality()
                .equals(other._firstHalf, _firstHalf) &&
            const DeepCollectionEquality()
                .equals(other._secondHalf, _secondHalf) &&
            const DeepCollectionEquality()
                .equals(other._intensive, _intensive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      year,
      belong,
      semester,
      const DeepCollectionEquality().hash(_firstHalf),
      const DeepCollectionEquality().hash(_secondHalf),
      const DeepCollectionEquality().hash(_intensive));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimetableImplCopyWith<_$TimetableImpl> get copyWith =>
      __$$TimetableImplCopyWithImpl<_$TimetableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimetableImplToJson(
      this,
    );
  }
}

abstract class _Timetable implements Timetable {
  const factory _Timetable(
      {required final String year,
      required final String belong,
      required final Semester semester,
      required final List<List<Subject?>> firstHalf,
      required final List<List<Subject?>> secondHalf,
      required final List<List<Subject?>> intensive}) = _$TimetableImpl;

  factory _Timetable.fromJson(Map<String, dynamic> json) =
      _$TimetableImpl.fromJson;

  @override
  String get year;
  @override
  String get belong;
  @override
  Semester get semester;
  @override
  List<List<Subject?>> get firstHalf;
  @override
  List<List<Subject?>> get secondHalf;
  @override
  List<List<Subject?>> get intensive;
  @override
  @JsonKey(ignore: true)
  _$$TimetableImplCopyWith<_$TimetableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
