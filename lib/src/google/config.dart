import 'package:authnull/src/auth/config.dart';
import 'package:flutter/material.dart';

class GoogleConfig extends AuthorizationConfig {
  @override
  final String type = AuthorizationPlatform.Google;
  final Icon icon;
  final Text lastLoginText;
  final Text methodText;
  final Color backgroundColor;

  GoogleConfig({
    this.icon,
    this.lastLoginText = const Text("LAST LOGGEDIN"),
    this.methodText = const Text('GOOGLE'),
    this.backgroundColor = Colors.blue,
  });
}

class GoogleStatus implements AuthorizationStatus {
  @override
  final String platform = AuthorizationPlatform.Google;

  final String username;
  final String displayName;
  final String identifier;
  final String email;
  final String phone;

  final Map<String, dynamic> infos;
  final Map<String, dynamic> beacons;

  final String token;

  GoogleStatus({
    @required this.username,
    @required this.displayName,
    @required this.identifier,
    @required this.email,
    @required this.phone,
    @required this.infos,
    @required this.beacons,
    @required this.token,
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
      'token': this.token,
    };
    return map;
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}
