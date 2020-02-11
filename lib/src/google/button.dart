import 'package:authnull/src/components/button.dart';
import 'package:authnull/src/google/config.dart';
import 'package:authnull/src/google/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleContinueWithButton extends StatelessWidget {
  final GoogleConfig config;
  final bool lastLogin;
  final Text lastLoginText;

  final void Function(GoogleStatus status) next;

  GoogleContinueWithButton({
    Key key,
    @required this.lastLogin,
    @required this.lastLoginText,
    @required this.config,
    @required this.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContinueWithButton(
      lastLogin: this.lastLogin,
      lastLoginText: this.lastLoginText,
      backgroundColor: Colors.blue,
      text: Text(
        "Google",
        style: TextStyle(color: Colors.white),
      ),
      icon: this._getIcon(),
      onPressed: () {
        signInWithGoogle().then((FirebaseUser user) {
          if (user != null) {
            final GoogleStatus result = GoogleStatus(
              user: user,
            );
            this.next(result);
          }
        });
      },
    );
  }

  Widget _getIcon() {
    if (this.config.icon == null) {
      return Icon(
        Icons.bookmark,
        color: Colors.white,
      );
    }
    return this.config.icon;
  }
}
