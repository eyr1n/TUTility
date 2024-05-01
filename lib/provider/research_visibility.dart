import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutility/provider/shared_preferences.dart';

part 'research_visibility.g.dart';

@riverpod
class ResearchVisibilityNotifier extends _$ResearchVisibilityNotifier {
  late SharedPreferences _sharedPreferences;

  @override
  bool build() {
    _sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
    try {
      final value = _sharedPreferences.getBool('research_visibility');
      return value ?? true;
    } catch (_) {
      return true;
    }
  }

  Future<bool> set(bool value) {
    state = value;
    return _sharedPreferences.setBool('research_visibility', value);
  }
}
