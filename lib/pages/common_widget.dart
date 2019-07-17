import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: TextEditingController(),
        decoration:
            InputDecoration(fillColor: Colors.grey, labelText: '搜索感兴趣商品'),
      ),
    );
  }
}
