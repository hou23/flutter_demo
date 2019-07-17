import 'package:flutter/material.dart';
import 'package:flutter_app/pages/index_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChangePro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink
      ),
      home: IndexPage(),
    );
  }

}