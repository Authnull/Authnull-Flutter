import 'package:authnull/src/auth/config.dart';
import 'package:flutter/material.dart';

class GoogleConfig extends AuthorizationConfig {
  @override
  final String type = AuthorizationPlatform.Google;

  GoogleConfig();
}

class GoogleStatus extends AuthorizationStaus {
  @override
  final String platform = AuthorizationPlatform.Google;

  final String raw;

  GoogleStatus({
    @required this.raw,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'raw': this.raw,
    };
    return map;
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}
