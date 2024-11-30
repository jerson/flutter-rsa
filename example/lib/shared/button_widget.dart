import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.result,
    required String title,
    required Function onPressed,
  })  : onPressed = onPressed,
        title = title;

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
          ElevatedButton(
            onPressed: () async {
              await widget.onPressed();
              setState(() {
                _loading = false;
              });
            },
            key: const Key("button"),
            child: Text(widget.title),
          ),
          (_loading)
              ? Text(
                  widget.result,
                  key: const Key("loading"),
                )
              : Text(
                  widget.result,
                  key: const Key("result"),
                )
        ],
      ),
    );
  }
}
