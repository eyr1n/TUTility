import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutility/providers/shared_preferences.dart';

part 'first_or_second.g.dart';

enum FirstOrSecond {
  first,
  second,
}

@riverpod
class FirstOrSecondNotifier extends _$FirstOrSecondNotifier {
  late SharedPreferences _sharedPreferences;

  @override
  FirstOrSecond build() {
    _sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
    try {
      final str = _sharedPreferences.getString('first_or_second');
      return str != null
          ? FirstOrSecond.values.byName(str)
          : FirstOrSecond.first;
    } catch (_) {
      return FirstOrSecond.first;
    }
  }

  Future<bool> set(FirstOrSecond value) {
    state = value;
    return _sharedPreferences.setString('first_or_second', value.name);
  }
}
