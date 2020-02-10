import 'package:authnull/src/auth/config.dart';
import 'package:flutter/material.dart';

class BrontosaurusConfig extends AuthorizationConfig {
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
  final String platform = AuthorizationPlatform.Brontosaurus;

  BrontosaurusStatus();
}
