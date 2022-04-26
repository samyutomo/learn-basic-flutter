import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      theme: ThemeData(),
      home: ScrollingScreen(),
    );
  }
}

class ScrollingScreen extends StatelessWidget {
  ScrollingScreen({Key? key}) : super(key: key);
  final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: numberList.map((number) {
        return Container(
          height: 250,
          decoration: BoxDecoration(
              color: Colors.grey, border: Border.all(color: Colors.black)),
          child: Center(
            child: Text(
              "$number",
              style: const TextStyle(fontSize: 50),
            ),
          ),
        );
      }).toList()),
    );
  }
}
