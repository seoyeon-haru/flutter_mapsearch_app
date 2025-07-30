import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: '검색어를 입력해 주세요.',
            ),
          ),
        ),
      ),
    );
  }
}
