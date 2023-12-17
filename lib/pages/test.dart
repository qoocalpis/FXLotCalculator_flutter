import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  const TextApp({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      _photoItem("pic0"),
      _photoItem("pic1"),
      _photoItem("pic2"),
      _photoItem("pic3"),
      _photoItem("pic4"),
      _photoItem("pic5"),
      _photoItem("pic5"),
      _photoItem("pic5"),
      _photoItem("pic5"),
      _photoItem("pic5"),
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('GridView'),
            ),
            body: GridView.count(crossAxisCount: 2, children: list)));
  }

  Widget _photoItem(String image) {
    return Container(
      child: Text('AAA'),
    );
  }
}
