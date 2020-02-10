import 'package:authnull/src/brontosaurus/login.dart';
import 'package:authnull/src/components/button.dart';
import 'package:flutter/material.dart';

class BrontosarusContinueWithButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContinueWithButton(
      backgroundColor: Colors.orangeAccent,
      text: Text(
        "Brontosaurus",
        style: TextStyle(color: Colors.white),
      ),
      icon: Icon(Icons.email),
      onPressed: () {
        Route route =
            MaterialPageRoute(builder: (context) => BrontosaurusLogin());
        Navigator.pushReplacement(context, route);
      },
    );
  }
}
