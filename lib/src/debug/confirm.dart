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
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                final DebugStatus status = DebugStatus(
                  username: this._usernameController.text,
                );
                widget.next(status);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
