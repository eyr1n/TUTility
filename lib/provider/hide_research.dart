import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutility/provider/shared_preferences.dart';

part 'hide_research.g.dart';

@riverpod
class HideResearchNotifier extends _$HideResearchNotifier {
  late SharedPreferences _sharedPreferences;

  @override
  bool build() {
    _sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
    try {
      final value = _sharedPreferences.getBool('hide_research');
      return value ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> set(bool value) {
    state = value;
    return _sharedPreferences.setBool('hide_research', value);
  }
}
