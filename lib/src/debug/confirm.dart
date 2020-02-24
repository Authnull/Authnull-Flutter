import 'package:authnull/authnull.dart';
import 'package:flutter/material.dart';

class DebugConfirm extends StatefulWidget {
  final void Function(DebugStatus status) next;

  DebugConfirm({
    Key key,
    @required this.next,
  }) : super(key: key);

  @override
  DebugConfirmState createState() => DebugConfirmState();
}

class DebugConfirmState extends State<DebugConfirm> {
  final _usernameController = TextEditingController();

  bool _allowSubmit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: this._usernameController,
              onChanged: (String next) {
                this.setState(() {
                  this._allowSubmit = next.isNotEmpty;
                });
              },
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: this._allowSubmit
                  ? () {
                      final String text = this._usernameController.text;
                      final DebugStatus status = DebugStatus(
                        username: text,
                        identifier: text + '-identifier',
                      );
                      widget.next(status);
                    }
                  : null,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
