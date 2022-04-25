import 'package:flutter/material.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Image",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Image"),
          ),
          body: Center(
            child: Image.network(
              'https://picsum.photos/200/300',
              width: 200,
              height: 300,
            ),
          )),
    );
  }
}
