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
      text: this.config.methodText,
      icon: this._getIcon(),
      onPressed: () {
        this.onPressed();
        try {
          signInWithGoogle().then((FirebaseUser user) {
            if (user != null) {
              user.getIdToken().then((IdTokenResult token) {
                final GoogleStatus result = GoogleStatus(
                  username: user.email,
                  displayName: user.displayName,
                  identifier: user.uid,
                  email: user.email,
                  phone: user.phoneNumber,
                  infos: {
                    'photo': user.photoUrl,
                  },
                  beacons: {},
                  token: token.token,
                );
                this.next(result);
              }).catchError((Object error) {
                this.onCancel();
              });
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
