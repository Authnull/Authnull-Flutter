import 'package:authnull/authnull.dart';
import 'package:authnull/src/auth/config.dart';
import 'package:authnull/src/brontosaurus/button.dart';
import 'package:authnull/src/brontosaurus/config.dart';
import 'package:authnull/src/google/button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Widget continueWithText;

  final String loginType;
  final List<AuthorizationConfig> configs;
  final void Function(AuthorizationStaus status) next;

  final Text lastLoginText;

  final Widget frame;

  SignIn({
    Key key,
    @required this.continueWithText,
    @required this.lastLoginText,
    @required this.loginType,
    @required this.configs,
    @required this.next,
    this.frame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: this._getFrame(),
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

  Widget _getFrame() {
    if (this.frame == null) {
      return Container();
    }
    return this.frame;
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
            lastLogin: this.loginType == AuthorizationPlatform.Brontosaurus,
            lastLoginText: this.lastLoginText,
            config: brontosaurusConfig,
            next: this.next,
          );
        }
      case AuthorizationPlatform.Google:
        {
          final GoogleConfig googleConfig = config;
          return GoogleContinueWithButton(
            lastLogin: this.loginType == AuthorizationPlatform.Google,
            lastLoginText: this.lastLoginText,
            config: googleConfig,
            next: this.next,
          );
        }
    }
    return Container();
  }
}
