import 'package:flutter/material.dart';
import 'TapBox.dart';
import 'TextSpanDemo.dart';
import 'FormLoginDemo.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: CounterWidget(),
//      home: ParentWidgetC(),
//      home: TextSpanWidget(),
      home: FormLoginWidget(),

    );
  }
}
