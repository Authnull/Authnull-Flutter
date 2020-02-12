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

  String _loginType;
  bool _showLogin = false;

  Future<void> _init() async {
    final AuthorizationManager manager = AuthorizationManager.instance();
    final String loginType = await manager.init();
    setState(() {
      this._loginType = loginType;
      this._showLogin = true;
    });
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
            Column(
              children: <Widget>[
                Expanded(
                  child: widget.frame != null ? widget.frame : Container(),
                ),
                AnimatedOpacity(
                  opacity: this._showLogin ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: SignIn(
                    configs: widget.configs,
                    loginType: this._loginType,
                    next: (AuthorizationStaus status) async {
                      final AuthorizationManager manager =
                          AuthorizationManager.instance();
                      await manager.setType(status.platform);
                      widget.onSignIn(status);
                    },
                    continueWithText: widget.continueWithText,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
