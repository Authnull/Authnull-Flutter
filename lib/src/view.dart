import 'dart:async';

import 'package:authnull/src/auth/auth.dart';
import 'package:authnull/src/auth/config.dart';
import 'package:authnull/src/components/sign-in.dart';
import 'package:flutter/material.dart';

class Authnull extends StatefulWidget {
  final Widget continueWithText;
  final ImageProvider<dynamic> backgroundImage;
  final List<AuthorizationConfig> configs;

  final void Function(AuthorizationStaus status) onSignIn;

  final Widget frame;

  Authnull({
    Key key,
    @required this.continueWithText,
    @required this.backgroundImage,
    @required this.configs,
    @required this.onSignIn,
    this.frame,
  }) : super(key: key);

  @override
  AuthnullState createState() => AuthnullState();
}

class AuthnullState extends State<Authnull> {
  @override
  void initState() {
    super.initState();
    this._init();
  }

  Future<void> _init() async {
    final AuthorizationManager manager = AuthorizationManager.instance();
    await manager.init();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SignIn(
              configs: widget.configs,
              next: (AuthorizationStaus status) async {
                final AuthorizationManager manager =
                    AuthorizationManager.instance();
                await manager.setType(status.platform);
                widget.onSignIn(status);
              },
              continueWithText: widget.continueWithText,
              frame: widget.frame,
            ),
          ],
        ),
      ),
    );
  }
}
