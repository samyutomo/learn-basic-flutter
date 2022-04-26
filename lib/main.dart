import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      theme: ThemeData(),
      home: const ExpandedWidget(),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          color: Colors.red,
        )),
        Expanded(
            child: Container(
          color: Colors.orange,
        )),
        Expanded(
            child: Container(
          color: Colors.yellow,
        )),
        Expanded(
            child: Container(
          color: Colors.green,
        )),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
            )),
        Expanded(
            child: Container(
          color: Colors.indigo,
        )),
        Expanded(
            child: Container(
          color: Colors.purple,
        ))
      ],
    );
  }
}
