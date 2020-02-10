import 'package:authnull_example/components/button.dart';
import 'package:flutter/material.dart';

class Authnull extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            ContinueWithButton(
              backgroundColor: Colors.orangeAccent,
              text: Text(
                "With Brontosaurus",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.email),
            ),
            ContinueWithButton(
              backgroundColor: Colors.orangeAccent,
              text: Text(
                "With Brontosaurus",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.email),
            ),
            ContinueWithButton(
              backgroundColor: Colors.orangeAccent,
              text: Text(
                "With Brontosaurus",
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
        ),
      ),
    );
  }
}
