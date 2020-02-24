import 'package:authnull/authnull.dart';
import 'package:authnull/src/auth/config.dart';
import 'package:authnull/src/brontosaurus/button.dart';
import 'package:authnull/src/brontosaurus/config.dart';
import 'package:authnull/src/debug/button.dart';
import 'package:authnull/src/debug/config.dart';
import 'package:authnull/src/google/button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Widget continueWithText;

  final String loginType;
  final List<AuthorizationConfig> configs;
  final void Function(AuthorizationStatus status) next;
  final void Function() onPressed;
  final void Function() onCancel;

  SignIn({
    Key key,
    @required this.continueWithText,
    @required this.loginType,
    @required this.configs,
    @required this.next,
    @required this.onPressed,
    @required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
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
          return BrontosaurusContinueWithButton(
            lastLogin: this.loginType == AuthorizationPlatform.Brontosaurus,
            config: brontosaurusConfig,
            next: this.next,
            onPressed: this.onPressed,
            onCancel: this.onCancel,
          );
        }
      case AuthorizationPlatform.Google:
        {
          final GoogleConfig googleConfig = config;
          return GoogleContinueWithButton(
            lastLogin: this.loginType == AuthorizationPlatform.Google,
            config: googleConfig,
            next: this.next,
            onPressed: this.onPressed,
            onCancel: this.onCancel,
          );
        }
      case AuthorizationPlatform.Debug:
        {
          final DebugConfig debugConfig = config;
          return DebugContinueWithButton(
            lastLogin: this.loginType == AuthorizationPlatform.Debug,
            config: debugConfig,
            next: this.next,
            onPressed: this.onPressed,
            onCancel: this.onCancel,
          );
        }
    }
    return Container();
  }
}
