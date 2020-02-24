import 'package:authnull/src/components/button.dart';
import 'package:authnull/src/debug/config.dart';
import 'package:authnull/src/debug/confirm.dart';
import 'package:flutter/material.dart';

class DebugContinueWithButton extends StatelessWidget {
  final DebugConfig config;
  final bool lastLogin;

  final void Function(DebugStatus status) next;
  final void Function() onPressed;
  final void Function() onCancel;

  DebugContinueWithButton({
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
      backgroundColor: this.config.backgroundColor,
      text: this.config.methodText,
      icon: this._getIcon(),
      onPressed: () {
        this.onPressed();
        Route route = MaterialPageRoute(
          builder: (context) => DebugConfirm(
            next: (DebugStatus status) {
              this.next(status);
            },
          ),
        );
        Navigator.push(context, route).whenComplete(this.onCancel);
      },
    );
  }

  Widget _getIcon() {
    if (this.config.icon == null) {
      return Icon(
        Icons.bug_report,
        color: Colors.white,
      );
    }
    return this.config.icon;
  }
}
