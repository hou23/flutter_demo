import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            child: NotificationListener(
              child: ListView(
                children: <Widget>[
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
