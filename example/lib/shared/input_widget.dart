import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.result,
    required String title,
    required Function(TextEditingController) onPressed,
  })  : onPressed = onPressed,
        title = title;

  final Function(TextEditingController) onPressed;
  final String title;
  final String result;

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _controller = TextEditingController();
  FocusNode? _focusNode;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller.text = "";
  }

  @override
  void dispose() {
    _focusNode!.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: false,
            focusNode: _focusNode,
            decoration: const InputDecoration(labelText: "Message"),
            controller: _controller,
            key: const Key("message"),
          ),
          ElevatedButton(
            onPressed: () async {
              _focusNode!.unfocus();
              await widget.onPressed(_controller);
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
