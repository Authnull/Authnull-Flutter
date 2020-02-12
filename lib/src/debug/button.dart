import 'package:authnull/src/components/button.dart';
import 'package:authnull/src/debug/config.dart';
import 'package:flutter/material.dart';

class DebugContinueWithButton extends StatelessWidget {
  final DebugConfig config;
  final bool lastLogin;

  final void Function(DebugStatus status) next;

  DebugContinueWithButton({
    Key key,
    @required this.lastLogin,
    @required this.config,
    @required this.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContinueWithButton(
      lastLogin: this.lastLogin,
      lastLoginText: this.config.lastLoginText,
      backgroundColor: Colors.grey,
      text: Text(
        "Debug",
        style: TextStyle(color: Colors.white),
      ),
      icon: this._getIcon(),
      onPressed: () {},
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
