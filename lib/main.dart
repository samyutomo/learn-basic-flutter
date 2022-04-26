import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Responsive Layout - MediaQuery vs LayoutBuilder",
      theme: ThemeData(),
      home: const ResponsivePage(),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrain) {
        if (constrain.maxWidth < 600) {
          return ListView(
            children: _generateContainers(),
          );
        } else if (constrain.maxWidth < 900) {
          return GridView.count(
            crossAxisCount: 2,
            children: _generateContainers(),
          );
        } else {
          return GridView.count(
            crossAxisCount: 6,
            children: _generateContainers(),
          );
        }
      }),
    );
  }

  List<Widget> _generateContainers() {
    return List<Widget>.generate(20, (index) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        color: Colors.blueGrey,
        height: 200,
      );
    });
  }
}
