import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      theme: ThemeData(),
      home: const ExpandedFlexibleWidget(),
    );
  }
}

class ExpandedFlexibleWidget extends StatelessWidget {
  const ExpandedFlexibleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(children: const [ExpandedWidget(), FlexibleWidget()]),
          Row(children: const [ExpandedWidget(), ExpandedWidget()]),
          Row(children: const [FlexibleWidget(), FlexibleWidget()]),
          Row(children: const [FlexibleWidget(), ExpandedWidget()])
        ],
      )),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.teal, border: Border.all(color: Colors.white)),
      child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Expanded",
            style: TextStyle(fontSize: 24, color: Colors.white),
          )),
    ));
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.tealAccent, border: Border.all(color: Colors.white)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Flexible",
          style: TextStyle(fontSize: 24, color: Colors.teal),
        ),
      ),
    ));
  }
}
