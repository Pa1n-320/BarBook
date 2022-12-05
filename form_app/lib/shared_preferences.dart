import 'package:shared_preferences/shared_preferences.dart';

final sharedPreference = SharedPreferencesHelper();

class SharedPreferencesHelper {
  late SharedPreferences _sharedPreferences;
  static const String NAME = "Name";
  static const String EMAIL = "Email";
  static const String PHONE = "Phone";
  static const String PASSWORD = "Password";
  static const String AUTH_STATUS = "authStatus";


  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> get authStatus async {
    return _sharedPreferences.getBool(AUTH_STATUS) ?? false;
  }

  void saveAuthStatus(bool value) {
    _sharedPreferences.setBool(AUTH_STATUS, value);
  }

  Future<void> saveUserName(String userName) async {
    _sharedPreferences.setString(NAME, userName);
  }

  String? get getUserName {
    return _sharedPreferences.getString(NAME);
  }
}