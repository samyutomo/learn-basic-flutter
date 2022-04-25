import 'package:flutter/material.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Font",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          /*
          remove comment symbol to make Poppins as default font
          fontFamily: 'Poppins'
          */
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Font"),
          ),
          body: const Center(
              child: Text(
            "Poppins Font",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ))),
    );
  }
}
