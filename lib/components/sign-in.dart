import 'package:authnull/components/button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: Text('Continue With'),
        ),
        ContinueWithButton(
          backgroundColor: Colors.orangeAccent,
          text: Text(
            "Brontosaurus",
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.email),
        ),
        ContinueWithButton(
          backgroundColor: Colors.orangeAccent,
          text: Text(
            "Brontosaurus",
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.email),
        ),
        ContinueWithButton(
          backgroundColor: Colors.orangeAccent,
          text: Text(
            "Brontosaurus",
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.email,
            color: Colors.red,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        ),
      ],
    );
  }
}
