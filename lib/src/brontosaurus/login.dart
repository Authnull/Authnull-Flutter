import 'package:authnull/src/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:brontosaurus_flutter/brontosaurus_flutter.dart';

class BrontosaurusLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BrontosaurusView(
      appBar: AppBar(
        title: Text('Login'),
      ),
      server: 'https://example.com',
      application: 'TEST',
      next: () async {
        final AuthorizationManager manager = AuthorizationManager.instance();
      },
    );
  }
}
