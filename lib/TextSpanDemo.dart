import 'package:flutter/material.dart';

class TextSpanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        TextSpan(
          text: "Home: ",
        ),
        TextSpan(
          text: "https://flutterchina.club",
          style: TextStyle(color: Colors.blue),
        ),
      ],
    ));
  }
}
