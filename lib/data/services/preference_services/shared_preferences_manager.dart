import 'package:batru_house_rental/data/services/preference_services/preference_keys.dart';
import 'package:batru_house_rental/presentation/utilities/enums/login_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferencesManager(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  /// Login Type
  Future<void> saveLoginType({required LoginType param}) async {
    await _sharedPreferences.setInt(
      PreferenceKeys.loginType.name,
      param.index,
    );
  }

  Future<bool> removeLoginType() async => _sharedPreferences.remove(
        PreferenceKeys.loginType.name,
      );

  int? getLoginType() => _sharedPreferences.getInt(
        PreferenceKeys.loginType.name,
      );
}
