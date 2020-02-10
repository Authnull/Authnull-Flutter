import 'package:authnull/components/sign-in.dart';
import 'package:flutter/material.dart';

class Authnull extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2020/02/04/20/48/italy-4819291_960_720.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SignIn(),
          ],
        ),
      ),
    );
  }
}
