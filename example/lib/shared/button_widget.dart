import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(title),
            onPressed: onPressed,
            key: Key("button"),
          ),
          (result == null || result == "")
              ? Text(
                  result,
                  key: Key("loading"),
                )
              : Text(
                  result,
                  key: Key("result"),
                )
        ],
      ),
    );
  }
}
