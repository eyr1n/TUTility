import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutility/model/term.dart';
import 'package:tutility/provider/shared_preferences.dart';

part 'term.g.dart';

@riverpod
class TermNotifier extends _$TermNotifier {
  late SharedPreferences _sharedPreferences;

  @override
  Term build() {
    _sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
    try {
      final str = _sharedPreferences.getString('term');
      return str != null ? Term.values.byName(str) : Term.firstHalf;
    } catch (_) {
      return Term.firstHalf;
    }
  }

  Future<bool> set(Term value) {
    state = value;
    return _sharedPreferences.setString('term', value.name);
  }
}
