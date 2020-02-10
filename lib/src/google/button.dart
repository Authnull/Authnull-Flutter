import 'package:authnull/src/components/button.dart';
import 'package:authnull/src/google/config.dart';
import 'package:flutter/material.dart';

class GoogleContinueWithButton extends StatelessWidget {
  final GoogleConfig config;

  final void Function(GoogleStatus status) next;

  GoogleContinueWithButton({
    Key key,
    @required this.config,
    @required this.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContinueWithButton(
      backgroundColor: Colors.blue,
      text: Text(
        "Google",
        style: TextStyle(color: Colors.white),
      ),
      icon: Icon(
        Icons.bookmark,
        color: Colors.white,
      ),
      onPressed: () {
        Route route = MaterialPageRoute(
          builder: (context) => Container(),
        );
        Navigator.pushReplacement(context, route);
      },
    );
  }
}
