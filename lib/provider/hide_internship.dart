import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutility/provider/shared_preferences.dart';

part 'hide_internship.g.dart';

@riverpod
class HideInternshipNotifier extends _$HideInternshipNotifier {
  late SharedPreferences _sharedPreferences;

  @override
  bool build() {
    _sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
    try {
      final value = _sharedPreferences.getBool('hide_internship');
      return value ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> set(bool value) {
    state = value;
    return _sharedPreferences.setBool('hide_internship', value);
  }
}
