import 'package:authnull/src/brontosaurus/config.dart';
import 'package:authnull/src/brontosaurus/login.dart';
import 'package:authnull/src/components/button.dart';
import 'package:flutter/material.dart';

class BrontosarusContinueWithButton extends StatelessWidget {
  final BrontosaurusConfig config;

  BrontosarusContinueWithButton({
    Key key,
    @required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContinueWithButton(
      backgroundColor: Colors.orangeAccent,
      text: Text(
        "Brontosaurus",
        style: TextStyle(color: Colors.white),
      ),
      icon: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      onPressed: () {
        Route route = MaterialPageRoute(
          builder: (context) => BrontosaurusLogin(
            config: this.config,
          ),
        );
        Navigator.pushReplacement(context, route);
      },
    );
  }
}
