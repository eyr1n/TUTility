import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timetable_visibility.g.dart';

@immutable
@JsonSerializable()
class TimetableVisibility {
  final List<List<int?>> list;

  const TimetableVisibility({required this.list});

  factory TimetableVisibility.fromJson(Map<String, dynamic> json) =>
      _$TimetableVisibilityFromJson(json);

  Map<String, dynamic> toJson() => _$TimetableVisibilityToJson(this);
}

class TimetableVisibilityNotifier extends StateNotifier<TimetableVisibility?> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  TimetableVisibilityNotifier(super.visibility);

  Future<void> update(TimetableVisibility visibility) async {
    state = visibility;
    (await prefs)
        .setString('tutility_timetable_visibility', jsonEncode(visibility));
  }

  Future<void> clear() async {
    state = null;
    (await prefs).remove('tutility_timetable_visibility');
  }
}

late final StateNotifierProvider<TimetableVisibilityNotifier,
    TimetableVisibility?> timetableVisibilityProvider;
