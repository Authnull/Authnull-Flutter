import 'package:authnull/src/brontosaurus/config.dart';
import 'package:authnull/src/brontosaurus/login.dart';
import 'package:authnull/src/components/button.dart';
import 'package:flutter/material.dart';

class BrontosarusContinueWithButton extends StatelessWidget {
  final BrontosaurusConfig config;
  final bool lastLogin;

  final void Function(BrontosaurusStatus status) next;
  final void Function() onPressed;

  BrontosarusContinueWithButton({
    Key key,
    @required this.lastLogin,
    @required this.config,
    @required this.next,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContinueWithButton(
      lastLogin: this.lastLogin,
      lastLoginText: this.config.lastLoginText,
      backgroundColor: Colors.orangeAccent,
      text: Text(
        "Brontosaurus",
        style: TextStyle(color: Colors.white),
      ),
      icon: this._getIcon(),
      onPressed: () {
        this.onPressed();
        Route route = MaterialPageRoute(
          builder: (context) => BrontosaurusLogin(
            config: this.config,
            next: (BrontosaurusStatus status) {
              this.next(status);
              Navigator.pop(context);
            },
          ),
        );
        Navigator.push(context, route);
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
