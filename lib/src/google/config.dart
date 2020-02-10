import 'package:authnull/src/auth/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleConfig extends AuthorizationConfig {
  @override
  final String type = AuthorizationPlatform.Google;

  GoogleConfig();
}

class GoogleStatus extends AuthorizationStaus {
  @override
  final String platform = AuthorizationPlatform.Google;

  final FirebaseUser user;

  GoogleStatus({
    @required this.user,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'displayName': this.user.displayName,
      'email': this.user.email,
    };
    return map;
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}
