import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AuthorizationManager {
  static final AuthorizationManager _instance = AuthorizationManager._();

  static AuthorizationManager instance() {
    return _instance;
  }

  AuthorizationManager._();

  bool _inited = false;

  Future<void> init() async {
    if (this._inited) {
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String type = preferences.getString('authnull-preference-type');
    print(type);
  }
}
