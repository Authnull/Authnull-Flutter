import 'package:authnull/src/brontosaurus/config.dart';
import 'package:authnull/src/brontosaurus/login.dart';
import 'package:authnull/src/components/button.dart';
import 'package:flutter/material.dart';

class BrontosarusContinueWithButton extends StatelessWidget {
  final BrontosaurusConfig config;
  final bool lastLogin;

  final void Function(BrontosaurusStatus status) next;
  final void Function() onPressed;
  final void Function() onCancel;

  BrontosarusContinueWithButton({
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
          builder: (context) => BrontosaurusLogin(
            config: this.config,
            next: (BrontosaurusStatus status) {
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
        Icons.favorite,
        color: Colors.red,
      );
    }
    return this.config.icon;
  }
}
