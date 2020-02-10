import 'package:authnull/src/brontosaurus/config.dart';
import 'package:brontosaurus_flutter/brontosaurus_flutter.dart';
import 'package:flutter/material.dart';

class BrontosaurusLogin extends StatelessWidget {
  final BrontosaurusConfig config;

  final void Function(BrontosaurusStatus status) next;

  BrontosaurusLogin({
    Key key,
    @required this.config,
    @required this.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BrontosaurusViewLite(
      appBar: this.config.appBar,
      server: this.config.server,
      application: this.config.applicationKey,
      next: (String token) async {
        this.next(BrontosaurusStatus());
        // final AuthorizationManager manager = AuthorizationManager.instance();
      },
    );
  }
}
