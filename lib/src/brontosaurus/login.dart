import 'dart:convert';

import 'package:authnull/src/brontosaurus/config.dart';
import 'package:brontosaurus_flutter/brontosaurus_flutter.dart';
import 'package:flutter/material.dart';

class BrontosaurusLogin extends StatelessWidget {
  final BrontosaurusConfig config;

  final void Function(BrontosaurusStatus status) next;

  BrontosaurusLogin({
    Key key,
    @required this.config,
    @required this.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BrontosaurusViewLite(
      appBar: this.config.appBar,
      server: this.config.server,
      application: this.config.applicationKey,
      next: (String token) async {
        Codec<String, String> stringToBase64 = utf8.fuse(base64);
        final List<String> splited = token.split('.').toList();

        final String normalizedHeader = base64.normalize(splited[0]);
        final String normalizedBody = base64.normalize(splited[1]);

        final Map<String, dynamic> header =
            json.decode(stringToBase64.decode(normalizedHeader));
        final Map<String, dynamic> body =
            json.decode(stringToBase64.decode(normalizedBody));

        final BrontosaurusStatus status = BrontosaurusStatus(
          username: body['username'],
          displayName: body['displayName'],
          identifier: body['username'] + '-' + header['key'],
          email: body['email'],
          phone: body['phone'],
          infos: body['infos'],
          beacons: body['beacons'],
          raw: token,
        );

        this.next(status);
      },
    );
  }
}
