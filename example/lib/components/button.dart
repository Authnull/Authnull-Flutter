import 'package:flutter/material.dart';

class ContinueWithButton extends StatelessWidget {
  final Color backgroundColor;
  final Text text;
  final Icon icon;
  final Function onPressed;

  ContinueWithButton(
      {this.backgroundColor = Colors.redAccent,
      this.text = const Text("REQUIRED TEXT"),
      this.icon = const Icon(Icons.email),
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: this.backgroundColor,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              this.icon,
              Expanded(
                child: Container(),
              ),
              this.text,
            ],
          ),
        ),
      ),
    );
  }
}
