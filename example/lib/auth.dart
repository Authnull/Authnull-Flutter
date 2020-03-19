import 'package:flutter/material.dart';
import 'package:authnull/authnull.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Authnull(
      continueWithText: Text(
        'Continue With',
        style: TextStyle(color: Colors.white),
      ),
      backgroundImage: NetworkImage(
        'https://cdn.pixabay.com/photo/2020/02/04/20/48/italy-4819291_960_720.jpg',
      ),
      configs: [
        GoogleConfig(
          lastLoginText: Text(
            'Option Picked Last Time',
            style: TextStyle(color: Colors.blueGrey),
          ),
        ),
        BrontosaurusConfig(
          appBar: AppBar(
            title: Text('Login'),
          ),
          lastLoginText: Text(
            'Option Picked Last Time',
            style: TextStyle(color: Colors.blueGrey),
          ),
          applicationKey: 'BRONTOSAURUS_RED',
          server: 'https://devl.auth.rpngo.com',
        ),
        DebugConfig(
          lastLoginText: Text(
            'Option Picked Last Time',
            style: TextStyle(color: Colors.blueGrey),
          ),
        ),
      ],
      onSignIn: (AuthorizationStatus status) {
        print(status.toString());
      },
    );
  }
}
