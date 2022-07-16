import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timetable.g.dart';

@immutable
@JsonSerializable()
class Subject {
  final String id, url, name;
  final String? area, term, required, units, grade, staff, room;

  const Subject({
    required this.id,
    required this.url,
    required this.name,
    this.area,
    this.term,
    this.required,
    this.units,
    this.grade,
    this.staff,
    this.room,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@immutable
@JsonSerializable()
class Timetable {
  final List<List<List<Subject>>> list;
  final DateTime lastUpdated;

  const Timetable({required this.list, required this.lastUpdated});

  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);

  Map<String, dynamic> toJson() => _$TimetableToJson(this);
}

class TimetableNotifier extends StateNotifier<Timetable?> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  TimetableNotifier(Timetable? timetable) : super(timetable);

  Future<void> update(Timetable timetable) async {
    state = timetable;
    (await prefs).setString('tutility_timetable', jsonEncode(timetable));
  }

  Future<void> clear() async {
    state = null;
    (await prefs).remove('tutility_timetable');
  }
}

late final StateNotifierProvider<TimetableNotifier, Timetable?>
    timetableProvider;
