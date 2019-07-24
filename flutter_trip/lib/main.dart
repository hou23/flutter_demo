import 'package:flutter/material.dart';

import 'tab_navigator.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChangePro',
      debugShowCheckedModeBanner: false,
      home: TabNavigator(),
    );
  }
}
