import 'package:authnull/src/auth/config.dart';
import 'package:flutter/material.dart';

class DebugConfig extends AuthorizationConfig {
  @override
  final String type = AuthorizationPlatform.Debug;
  final Icon icon;
  final Text lastLoginText;

  DebugConfig({
    this.icon,
    this.lastLoginText = const Text("LAST LOGGEDIN"),
  });
}

class DebugStatus implements AuthorizationStaus {
  @override
  final String platform = AuthorizationPlatform.Debug;

  final String username;
  final String displayName = 'Display Name';
  final String identifier;
  final String email = 'example@example.com';
  final String phone = '1234567890';

  final Map<String, dynamic> infos = Map();
  final Map<String, dynamic> beacons = Map();

  DebugStatus({
    @required this.username,
    @required this.identifier,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'platform': this.platform,
      'username': this.username,
      'displayName': this.displayName,
      'identifier': this.identifier,
      'email': this.email,
      'phone': this.phone,
      'infos': this.infos,
      'beacons': this.beacons,
    };
    return map;
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}
