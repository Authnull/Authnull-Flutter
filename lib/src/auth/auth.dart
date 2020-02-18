import 'package:authnull/authnull.dart';
import 'package:authnull/src/google/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AuthorizationManager {
  static final AuthorizationManager _instance = AuthorizationManager._();

  static AuthorizationManager instance() {
    return _instance;
  }

  static Future<String> getPerferenceType() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String type = preferences.getString('authnull-preference-type');
    return type;
  }

  AuthorizationManager._();

  bool _inited = false;
  String type;

  Future<String> init() async {
    if (this._inited) {
      return this.type;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String type = preferences.getString('authnull-preference-type');
    this.type = type;
    return type;
  }

  Future<void> setType(String type) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('authnull-preference-type', type);
    this.type = type;
  }

  Future<void> signOut() async {
    this.init();
    if (this.type == null) {
      return;
    }
    switch (this.type) {
      case AuthorizationPlatform.Google:
        {
          await signOutGoogle();
        }
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('authnull-preference-type');
    return;
  }
}
