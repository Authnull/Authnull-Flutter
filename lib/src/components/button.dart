import 'package:flutter/material.dart';

class ContinueWithButton extends StatelessWidget {
  final Color backgroundColor;
  final Text text;
  final Icon icon;

  final bool lastLogin;
  final Text lastLoginText;

  final Function onPressed;

  ContinueWithButton({
    this.backgroundColor = Colors.redAccent,
    this.text = const Text("REQUIRED TEXT"),
    this.lastLoginText = const Text("REQUIRED TEXT"),
    this.icon = const Icon(Icons.email),
    this.lastLogin = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: this.lastLogin ? 65.0 : 50.0,
        child: this._renderButton(),
      ),
    );
  }

  Widget _renderButton() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: RaisedButton(
        color: this.backgroundColor,
        onPressed: this.onPressed,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                this.icon,
                Expanded(
                  child: Container(),
                ),
                this.text,
              ],
            ),
            this._renderExtra(),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderExtra() {
    if (this.lastLogin) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          this.lastLoginText,
        ],
      );
    }
    return Container();
  }
}
