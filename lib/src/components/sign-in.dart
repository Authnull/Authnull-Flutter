import 'package:authnull/authnull.dart';
import 'package:authnull/src/auth/config.dart';
import 'package:authnull/src/brontosaurus/button.dart';
import 'package:authnull/src/brontosaurus/config.dart';
import 'package:authnull/src/google/button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Widget continueWithText;

  final List<AuthorizationConfig> configs;
  final void Function(AuthorizationStaus status) next;

  SignIn({
    Key key,
    @required this.continueWithText,
    @required this.configs,
    @required this.next,
  }) : super(key: key);

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
          child: this.continueWithText,
        ),
        ...this._renderConfigs(this.configs),
        Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        ),
      ],
    );
  }

  List<Widget> _renderConfigs(List<AuthorizationConfig> configs) {
    return configs
        .map((AuthorizationConfig config) => this._renderConfig(config))
        .toList();
  }

  Widget _renderConfig(AuthorizationConfig config) {
    switch (config.type) {
      case AuthorizationPlatform.Brontosaurus:
        {
          final BrontosaurusConfig brontosaurusConfig = config;
          return BrontosarusContinueWithButton(
            config: brontosaurusConfig,
            next: this.next,
          );
        }
      case AuthorizationPlatform.Google:
        {
          final GoogleConfig googleConfig = config;
          return GoogleContinueWithButton(
            config: googleConfig,
            next: this.next,
          );
        }
    }
    return Container();
  }
}
