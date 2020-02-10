import 'package:authnull/src/brontosaurus/config.dart';
import 'package:authnull/src/brontosaurus/login.dart';
import 'package:authnull/src/components/button.dart';
import 'package:flutter/material.dart';

class BrontosarusContinueWithButton extends StatelessWidget {
  final BrontosaurusConfig config;

  final void Function(BrontosaurusStatus status) next;

  BrontosarusContinueWithButton({
    Key key,
    @required this.config,
    @required this.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContinueWithButton(
      backgroundColor: Colors.orangeAccent,
      text: Text(
        "Brontosaurus",
        style: TextStyle(color: Colors.white),
      ),
      icon: this._getIcon(),
      onPressed: () {
        Route route = MaterialPageRoute(
          builder: (context) => BrontosaurusLogin(
            config: this.config,
            next: this.next,
          ),
        );
        Navigator.pushReplacement(context, route);
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
