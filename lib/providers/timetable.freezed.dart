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

TimetableFromJs _$TimetableFromJsFromJson(Map<String, dynamic> json) {
  return _TimetableFromJs.fromJson(json);
}

/// @nodoc
mixin _$TimetableFromJs {
  int get year => throw _privateConstructorUsedError;
  String get term => throw _privateConstructorUsedError;
  List<List<List<Subject>>> get normal => throw _privateConstructorUsedError;
  List<List<List<Subject>>> get intensive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableFromJsCopyWith<TimetableFromJs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableFromJsCopyWith<$Res> {
  factory $TimetableFromJsCopyWith(
          TimetableFromJs value, $Res Function(TimetableFromJs) then) =
      _$TimetableFromJsCopyWithImpl<$Res, TimetableFromJs>;
  @useResult
  $Res call(
      {int year,
      String term,
      List<List<List<Subject>>> normal,
      List<List<List<Subject>>> intensive});
}

/// @nodoc
class _$TimetableFromJsCopyWithImpl<$Res, $Val extends TimetableFromJs>
    implements $TimetableFromJsCopyWith<$Res> {
  _$TimetableFromJsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? term = null,
    Object? normal = null,
    Object? intensive = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      normal: null == normal
          ? _value.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as List<List<List<Subject>>>,
      intensive: null == intensive
          ? _value.intensive
          : intensive // ignore: cast_nullable_to_non_nullable
              as List<List<List<Subject>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimetableFromJsImplCopyWith<$Res>
    implements $TimetableFromJsCopyWith<$Res> {
  factory _$$TimetableFromJsImplCopyWith(_$TimetableFromJsImpl value,
          $Res Function(_$TimetableFromJsImpl) then) =
      __$$TimetableFromJsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int year,
      String term,
      List<List<List<Subject>>> normal,
      List<List<List<Subject>>> intensive});
}

/// @nodoc
class __$$TimetableFromJsImplCopyWithImpl<$Res>
    extends _$TimetableFromJsCopyWithImpl<$Res, _$TimetableFromJsImpl>
    implements _$$TimetableFromJsImplCopyWith<$Res> {
  __$$TimetableFromJsImplCopyWithImpl(
      _$TimetableFromJsImpl _value, $Res Function(_$TimetableFromJsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? term = null,
    Object? normal = null,
    Object? intensive = null,
  }) {
    return _then(_$TimetableFromJsImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      normal: null == normal
          ? _value._normal
          : normal // ignore: cast_nullable_to_non_nullable
              as List<List<List<Subject>>>,
      intensive: null == intensive
          ? _value._intensive
          : intensive // ignore: cast_nullable_to_non_nullable
              as List<List<List<Subject>>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimetableFromJsImpl implements _TimetableFromJs {
  const _$TimetableFromJsImpl(
      {required this.year,
      required this.term,
      required final List<List<List<Subject>>> normal,
      required final List<List<List<Subject>>> intensive})
      : _normal = normal,
        _intensive = intensive;

  factory _$TimetableFromJsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableFromJsImplFromJson(json);

  @override
  final int year;
  @override
  final String term;
  final List<List<List<Subject>>> _normal;
  @override
  List<List<List<Subject>>> get normal {
    if (_normal is EqualUnmodifiableListView) return _normal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_normal);
  }

  final List<List<List<Subject>>> _intensive;
  @override
  List<List<List<Subject>>> get intensive {
    if (_intensive is EqualUnmodifiableListView) return _intensive;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intensive);
  }

  @override
  String toString() {
    return 'TimetableFromJs(year: $year, term: $term, normal: $normal, intensive: $intensive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimetableFromJsImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.term, term) || other.term == term) &&
            const DeepCollectionEquality().equals(other._normal, _normal) &&
            const DeepCollectionEquality()
                .equals(other._intensive, _intensive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      year,
      term,
      const DeepCollectionEquality().hash(_normal),
      const DeepCollectionEquality().hash(_intensive));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimetableFromJsImplCopyWith<_$TimetableFromJsImpl> get copyWith =>
      __$$TimetableFromJsImplCopyWithImpl<_$TimetableFromJsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimetableFromJsImplToJson(
      this,
    );
  }
}

abstract class _TimetableFromJs implements TimetableFromJs {
  const factory _TimetableFromJs(
          {required final int year,
          required final String term,
          required final List<List<List<Subject>>> normal,
          required final List<List<List<Subject>>> intensive}) =
      _$TimetableFromJsImpl;

  factory _TimetableFromJs.fromJson(Map<String, dynamic> json) =
      _$TimetableFromJsImpl.fromJson;

  @override
  int get year;
  @override
  String get term;
  @override
  List<List<List<Subject>>> get normal;
  @override
  List<List<List<Subject>>> get intensive;
  @override
  @JsonKey(ignore: true)
  _$$TimetableFromJsImplCopyWith<_$TimetableFromJsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return _Timetable.fromJson(json);
}

/// @nodoc
mixin _$Timetable {
  Period get period => throw _privateConstructorUsedError;
  List<List<Subject?>> get firstHalf => throw _privateConstructorUsedError;
  List<List<Subject?>> get secondHalf => throw _privateConstructorUsedError;

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
      {Period period,
      List<List<Subject?>> firstHalf,
      List<List<Subject?>> secondHalf});
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
    Object? period = null,
    Object? firstHalf = null,
    Object? secondHalf = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
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
abstract class _$$TimetableImplCopyWith<$Res>
    implements $TimetableCopyWith<$Res> {
  factory _$$TimetableImplCopyWith(
          _$TimetableImpl value, $Res Function(_$TimetableImpl) then) =
      __$$TimetableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Period period,
      List<List<Subject?>> firstHalf,
      List<List<Subject?>> secondHalf});
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
    Object? period = null,
    Object? firstHalf = null,
    Object? secondHalf = null,
  }) {
    return _then(_$TimetableImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
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
class _$TimetableImpl implements _Timetable {
  const _$TimetableImpl(
      {required this.period,
      required final List<List<Subject?>> firstHalf,
      required final List<List<Subject?>> secondHalf})
      : _firstHalf = firstHalf,
        _secondHalf = secondHalf;

  factory _$TimetableImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableImplFromJson(json);

  @override
  final Period period;
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
    return 'Timetable(period: $period, firstHalf: $firstHalf, secondHalf: $secondHalf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimetableImpl &&
            (identical(other.period, period) || other.period == period) &&
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
      const DeepCollectionEquality().hash(_firstHalf),
      const DeepCollectionEquality().hash(_secondHalf));

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
      {required final Period period,
      required final List<List<Subject?>> firstHalf,
      required final List<List<Subject?>> secondHalf}) = _$TimetableImpl;

  factory _Timetable.fromJson(Map<String, dynamic> json) =
      _$TimetableImpl.fromJson;

  @override
  Period get period;
  @override
  List<List<Subject?>> get firstHalf;
  @override
  List<List<Subject?>> get secondHalf;
  @override
  @JsonKey(ignore: true)
  _$$TimetableImplCopyWith<_$TimetableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
