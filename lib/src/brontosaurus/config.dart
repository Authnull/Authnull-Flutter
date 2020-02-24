import 'package:authnull/src/auth/config.dart';
import 'package:flutter/material.dart';

class BrontosaurusConfig extends AuthorizationConfig {
  @override
  final String type = AuthorizationPlatform.Brontosaurus;
  final AppBar appBar;
  final Icon icon;
  final Text lastLoginText;
  final Text methodText;

  final String server;
  final String applicationKey;

  BrontosaurusConfig({
    @required this.server,
    @required this.applicationKey,
    this.appBar,
    this.icon,
    this.lastLoginText = const Text('LAST LOGGEDIN'),
    this.methodText = const Text('BRONTOSAURUS'),
  });
}

class BrontosaurusStatus implements AuthorizationStaus {
  final String platform = AuthorizationPlatform.Brontosaurus;

  final String username;
  final String displayName;
  final String identifier;
  final String email;
  final String phone;

  final Map<String, dynamic> infos;
  final Map<String, dynamic> beacons;

  final String raw;

  BrontosaurusStatus({
    @required this.username,
    @required this.displayName,
    @required this.identifier,
    @required this.email,
    @required this.phone,
    @required this.infos,
    @required this.beacons,
    @required this.raw,
  });

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
      'raw': this.raw,
    };
    return map;
  }

  String toString() {
    return this.toMap().toString();
  }
}
