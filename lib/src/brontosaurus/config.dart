import 'package:authnull/src/auth/config.dart';
import 'package:flutter/material.dart';

class BrontosaurusConfig extends AuthorizationConfig {
  @override
  final String type = AuthorizationPlatform.Brontosaurus;
  final AppBar appBar;

  final String server;
  final String applicationKey;

  BrontosaurusConfig({
    @required this.server,
    @required this.applicationKey,
    this.appBar,
  });
}

class BrontosaurusStatus extends AuthorizationStaus {
  @override
  final String platform = AuthorizationPlatform.Brontosaurus;

  final String raw;

  BrontosaurusStatus({
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
