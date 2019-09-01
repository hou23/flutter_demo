import 'package:flutter/material.dart';
import 'package:flutter_app/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SearchBar(
            hideLeft: true,
            defaultText: '哈哈',
            hint: '123',
            leftButtonClick: () {
              Navigator.pop(context);
            },
            onChanged: _onTextChange,
          ),
        ],
      ),
    );
  }

  _onTextChange(text) {

  }
}
