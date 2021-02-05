import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    Key key,
    @required this.result,
    @required String title,
    @required Function onPressed,
  })  : onPressed = onPressed,
        title = title,
        super(key: key);

  final Function onPressed;
  final String title;
  final String result;

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(widget.title),
            onPressed: () async {
              await widget.onPressed();
              setState(() {
                _loading = false;
              });
            },
            key: Key("button"),
          ),
          (_loading)
              ? Text(
                  widget.result,
                  key: Key("loading"),
                )
              : Text(
                  widget.result,
                  key: Key("result"),
                )
        ],
      ),
    );
  }
}
