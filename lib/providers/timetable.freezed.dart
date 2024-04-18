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

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get area => throw _privateConstructorUsedError;
  String? get term => throw _privateConstructorUsedError;
  String? get required => throw _privateConstructorUsedError;
  String? get units => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;
  String? get staff => throw _privateConstructorUsedError;
  String? get room => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call(
      {String id,
      String url,
      String name,
      String? area,
      String? term,
      String? required,
      String? units,
      String? grade,
      String? staff,
      String? room});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? name = null,
    Object? area = freezed,
    Object? term = freezed,
    Object? required = freezed,
    Object? units = freezed,
    Object? grade = freezed,
    Object? staff = freezed,
    Object? room = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      term: freezed == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as String?,
      units: freezed == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      staff: freezed == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as String?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectImplCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$SubjectImplCopyWith(
          _$SubjectImpl value, $Res Function(_$SubjectImpl) then) =
      __$$SubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String url,
      String name,
      String? area,
      String? term,
      String? required,
      String? units,
      String? grade,
      String? staff,
      String? room});
}

/// @nodoc
class __$$SubjectImplCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$SubjectImpl>
    implements _$$SubjectImplCopyWith<$Res> {
  __$$SubjectImplCopyWithImpl(
      _$SubjectImpl _value, $Res Function(_$SubjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? name = null,
    Object? area = freezed,
    Object? term = freezed,
    Object? required = freezed,
    Object? units = freezed,
    Object? grade = freezed,
    Object? staff = freezed,
    Object? room = freezed,
  }) {
    return _then(_$SubjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      term: freezed == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as String?,
      units: freezed == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      staff: freezed == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as String?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectImpl implements _Subject {
  const _$SubjectImpl(
      {required this.id,
      required this.url,
      required this.name,
      this.area,
      this.term,
      this.required,
      this.units,
      this.grade,
      this.staff,
      this.room});

  factory _$SubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectImplFromJson(json);

  @override
  final String id;
  @override
  final String url;
  @override
  final String name;
  @override
  final String? area;
  @override
  final String? term;
  @override
  final String? required;
  @override
  final String? units;
  @override
  final String? grade;
  @override
  final String? staff;
  @override
  final String? room;

  @override
  String toString() {
    return 'Subject(id: $id, url: $url, name: $name, area: $area, term: $term, required: $required, units: $units, grade: $grade, staff: $staff, room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.staff, staff) || other.staff == staff) &&
            (identical(other.room, room) || other.room == room));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, name, area, term,
      required, units, grade, staff, room);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      __$$SubjectImplCopyWithImpl<_$SubjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectImplToJson(
      this,
    );
  }
}

abstract class _Subject implements Subject {
  const factory _Subject(
      {required final String id,
      required final String url,
      required final String name,
      final String? area,
      final String? term,
      final String? required,
      final String? units,
      final String? grade,
      final String? staff,
      final String? room}) = _$SubjectImpl;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$SubjectImpl.fromJson;

  @override
  String get id;
  @override
  String get url;
  @override
  String get name;
  @override
  String? get area;
  @override
  String? get term;
  @override
  String? get required;
  @override
  String? get units;
  @override
  String? get grade;
  @override
  String? get staff;
  @override
  String? get room;
  @override
  @JsonKey(ignore: true)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Timetable2 _$Timetable2FromJson(Map<String, dynamic> json) {
  return _Timetable2.fromJson(json);
}

/// @nodoc
mixin _$Timetable2 {
  int get period => throw _privateConstructorUsedError;
  int get firstOrSecond => throw _privateConstructorUsedError;
  List<List<Subject?>> get firstHalf => throw _privateConstructorUsedError;
  List<List<Subject?>> get secondHalf => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Timetable2CopyWith<Timetable2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Timetable2CopyWith<$Res> {
  factory $Timetable2CopyWith(
          Timetable2 value, $Res Function(Timetable2) then) =
      _$Timetable2CopyWithImpl<$Res, Timetable2>;
  @useResult
  $Res call(
      {int period,
      int firstOrSecond,
      List<List<Subject?>> firstHalf,
      List<List<Subject?>> secondHalf});
}

/// @nodoc
class _$Timetable2CopyWithImpl<$Res, $Val extends Timetable2>
    implements $Timetable2CopyWith<$Res> {
  _$Timetable2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? firstOrSecond = null,
    Object? firstHalf = null,
    Object? secondHalf = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      firstOrSecond: null == firstOrSecond
          ? _value.firstOrSecond
          : firstOrSecond // ignore: cast_nullable_to_non_nullable
              as int,
      firstHalf: null == firstHalf
          ? _value.firstHalf
          : firstHalf // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
      secondHalf: null == secondHalf
          ? _value.secondHalf
          : secondHalf // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Timetable2ImplCopyWith<$Res>
    implements $Timetable2CopyWith<$Res> {
  factory _$$Timetable2ImplCopyWith(
          _$Timetable2Impl value, $Res Function(_$Timetable2Impl) then) =
      __$$Timetable2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int period,
      int firstOrSecond,
      List<List<Subject?>> firstHalf,
      List<List<Subject?>> secondHalf});
}

/// @nodoc
class __$$Timetable2ImplCopyWithImpl<$Res>
    extends _$Timetable2CopyWithImpl<$Res, _$Timetable2Impl>
    implements _$$Timetable2ImplCopyWith<$Res> {
  __$$Timetable2ImplCopyWithImpl(
      _$Timetable2Impl _value, $Res Function(_$Timetable2Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? firstOrSecond = null,
    Object? firstHalf = null,
    Object? secondHalf = null,
  }) {
    return _then(_$Timetable2Impl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      firstOrSecond: null == firstOrSecond
          ? _value.firstOrSecond
          : firstOrSecond // ignore: cast_nullable_to_non_nullable
              as int,
      firstHalf: null == firstHalf
          ? _value._firstHalf
          : firstHalf // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
      secondHalf: null == secondHalf
          ? _value._secondHalf
          : secondHalf // ignore: cast_nullable_to_non_nullable
              as List<List<Subject?>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Timetable2Impl implements _Timetable2 {
  const _$Timetable2Impl(
      {required this.period,
      required this.firstOrSecond,
      required final List<List<Subject?>> firstHalf,
      required final List<List<Subject?>> secondHalf})
      : _firstHalf = firstHalf,
        _secondHalf = secondHalf;

  factory _$Timetable2Impl.fromJson(Map<String, dynamic> json) =>
      _$$Timetable2ImplFromJson(json);

  @override
  final int period;
  @override
  final int firstOrSecond;
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

  @override
  String toString() {
    return 'Timetable2(period: $period, firstOrSecond: $firstOrSecond, firstHalf: $firstHalf, secondHalf: $secondHalf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Timetable2Impl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.firstOrSecond, firstOrSecond) ||
                other.firstOrSecond == firstOrSecond) &&
            const DeepCollectionEquality()
                .equals(other._firstHalf, _firstHalf) &&
            const DeepCollectionEquality()
                .equals(other._secondHalf, _secondHalf));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      period,
      firstOrSecond,
      const DeepCollectionEquality().hash(_firstHalf),
      const DeepCollectionEquality().hash(_secondHalf));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Timetable2ImplCopyWith<_$Timetable2Impl> get copyWith =>
      __$$Timetable2ImplCopyWithImpl<_$Timetable2Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Timetable2ImplToJson(
      this,
    );
  }
}

abstract class _Timetable2 implements Timetable2 {
  const factory _Timetable2(
      {required final int period,
      required final int firstOrSecond,
      required final List<List<Subject?>> firstHalf,
      required final List<List<Subject?>> secondHalf}) = _$Timetable2Impl;

  factory _Timetable2.fromJson(Map<String, dynamic> json) =
      _$Timetable2Impl.fromJson;

  @override
  int get period;
  @override
  int get firstOrSecond;
  @override
  List<List<Subject?>> get firstHalf;
  @override
  List<List<Subject?>> get secondHalf;
  @override
  @JsonKey(ignore: true)
  _$$Timetable2ImplCopyWith<_$Timetable2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return _Timetable.fromJson(json);
}

/// @nodoc
mixin _$Timetable {
  List<List<List<Subject>>> get list => throw _privateConstructorUsedError;

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
  $Res call({List<List<List<Subject>>> list});
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
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<List<List<Subject>>>,
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
  $Res call({List<List<List<Subject>>> list});
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
    Object? list = null,
  }) {
    return _then(_$TimetableImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<List<List<Subject>>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimetableImpl implements _Timetable {
  const _$TimetableImpl({required final List<List<List<Subject>>> list})
      : _list = list;

  factory _$TimetableImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableImplFromJson(json);

  final List<List<List<Subject>>> _list;
  @override
  List<List<List<Subject>>> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'Timetable(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimetableImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

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
  const factory _Timetable({required final List<List<List<Subject>>> list}) =
      _$TimetableImpl;

  factory _Timetable.fromJson(Map<String, dynamic> json) =
      _$TimetableImpl.fromJson;

  @override
  List<List<List<Subject>>> get list;
  @override
  @JsonKey(ignore: true)
  _$$TimetableImplCopyWith<_$TimetableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
