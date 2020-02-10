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
    return BrontosaurusViewLite(
      appBar: this.config.appBar,
      server: this.config.server,
      application: this.config.applicationKey,
      next: (String token) async {
        // final AuthorizationManager manager = AuthorizationManager.instance();
      },
    );
  }
}
