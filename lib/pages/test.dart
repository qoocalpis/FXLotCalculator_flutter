import 'package:flutter/material.dart';

class SampleListView extends StatefulWidget {
  const SampleListView({super.key});

  @override
  SampleListViewState createState() => SampleListViewState();
}

class SampleListViewState extends State<SampleListView> {
  late String _message = '';
  late int _index = 0;

  @override
  void initState() {
    _message = 'OK';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> text = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Sample List View App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                _message,
                style: TextStyle(fontSize: 20.0),
              ),
              for (var index in text)
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('$index'),
                  selected: _index == index,
                  onTap: () {
                    _index = index;
                    _tapTile();
                  },
                )
            ],
          ),
        ));
  }

  void _tapTile() {
    setState(() {
      _message = 'No. $_index を選択しました';
    });
  }
}
