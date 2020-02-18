import 'package:authnull/src/components/button.dart';
import 'package:authnull/src/google/config.dart';
import 'package:authnull/src/google/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleContinueWithButton extends StatelessWidget {
  final GoogleConfig config;
  final bool lastLogin;

  final void Function(GoogleStatus status) next;
  final void Function() onPressed;
  final void Function() onCancel;

  GoogleContinueWithButton({
    Key key,
    @required this.lastLogin,
    @required this.config,
    @required this.next,
    @required this.onPressed,
    @required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContinueWithButton(
      lastLogin: this.lastLogin,
      lastLoginText: this.config.lastLoginText,
      backgroundColor: Colors.blue,
      text: Text(
        "Google",
        style: TextStyle(color: Colors.white),
      ),
      icon: this._getIcon(),
      onPressed: () {
        this.onPressed();
        try {
          signInWithGoogle().then((FirebaseUser user) {
            if (user != null) {
              final GoogleStatus result = GoogleStatus(
                user: user,
              );
              this.next(result);
            } else {
              this.onCancel();
            }
          }).catchError((Object error) {
            this.onCancel();
          });
        } on Exception {
          this.onCancel();
        }
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
