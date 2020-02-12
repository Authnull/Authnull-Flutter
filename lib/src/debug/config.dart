import 'package:authnull/src/auth/config.dart';
import 'package:flutter/material.dart';

class DebugConfig extends AuthorizationConfig {
  @override
  final String type = AuthorizationPlatform.Debug;
  final Icon icon;

  DebugConfig({
    this.icon,
  });
}

class DebugStatus extends AuthorizationStaus {
  @override
  final String platform = AuthorizationPlatform.Debug;

  final String username;

  DebugStatus({
    @required this.username,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      username: this.username,
    };
    return map;
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}
