import 'package:flutter/material.dart';
import 'package:authnull/authnull.dart';

void main() => runApp(
      Authnull(
        continueWithText: Text(
          'Continue With',
          style: TextStyle(color: Colors.white),
        ),
        backgroundImage: NetworkImage(
          'https://cdn.pixabay.com/photo/2020/02/04/20/48/italy-4819291_960_720.jpg',
        ),
        configs: [
          BrontosaurusConfig(
            appBar: AppBar(
              title: Text('Login'),
            ),
            applicationKey: 'Test',
            server: 'https://example.com',
          )
        ],
      ),
    );
