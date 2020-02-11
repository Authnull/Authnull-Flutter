import 'package:flutter/material.dart';
import 'package:authnull/authnull.dart';

void main() => runApp(
      Authnull(
        continueWithText: Text(
          'Continue With',
          style: TextStyle(color: Colors.white),
        ),
        lastLoginText: Text(
          'Option Picked Last Time',
          style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundImage: NetworkImage(
          'https://cdn.pixabay.com/photo/2020/02/04/20/48/italy-4819291_960_720.jpg',
        ),
        configs: [
          GoogleConfig(),
          BrontosaurusConfig(
            appBar: AppBar(
              title: Text('Login'),
            ),
            icon: Icon(Icons.ac_unit),
            applicationKey: 'Test',
            server: 'https://example.com',
          ),
        ],
        onSignIn: (AuthorizationStaus status) {
          print(status.toString());
        },
      ),
    );
