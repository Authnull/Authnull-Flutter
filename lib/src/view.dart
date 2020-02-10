import 'package:authnull/src/auth/auth.dart';
import 'package:authnull/src/components/sign-in.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Authnull extends StatefulWidget {
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
                  image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2020/02/04/20/48/italy-4819291_960_720.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SignIn(),
          ],
        ),
      ),
    );
  }
}
