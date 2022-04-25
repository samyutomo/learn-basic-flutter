import 'package:flutter/material.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Padding Center",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Padding & Center"),
          ),
          body:
              /* remove comment symbol (//) below to see what padding or center acts */
              // Padding(
              //   padding: EdgeInsets.all(30),
              //   child: Text("Ini Padding"),
              // )
              Center(
                child: Text("Text berada di tengah"),
              )
          ),
        );
  }
}
