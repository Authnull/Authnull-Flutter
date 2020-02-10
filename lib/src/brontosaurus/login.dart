import 'package:authnull/src/brontosaurus/config.dart';
import 'package:brontosaurus_flutter/brontosaurus_flutter.dart';
import 'package:flutter/material.dart';

class BrontosaurusLogin extends StatelessWidget {
  final BrontosaurusConfig config;

  BrontosaurusLogin({
    Key key,
    @required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BrontosaurusView(
      appBar: this.config.appBar,
      server: this.config.server,
      application: this.config.applicationKey,
      next: () async {
        // final AuthorizationManager manager = AuthorizationManager.instance();
      },
    );
  }
}
