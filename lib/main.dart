import 'package:flutter/material.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget{
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext  context) {
    return MaterialApp(
      title: "Container",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Screen"),
        ),
        body: Column(
          children: [
            Container(
              child: const Text("Hi", style: TextStyle(fontSize: 40),),
              color: Colors.blue,
            ),
            Container(
              child: const Text("Hi", style: TextStyle(fontSize: 40),),
              color: Colors.blue,
              width: 200,
              height: 100,
            ),
            Container(
              child: const Text("Hi", style: TextStyle(fontSize: 40),),
              color: Colors.blue,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              child: const Text("Hi", style: TextStyle(fontSize: 40),),
              color: Colors.blue,
              margin: const EdgeInsets.all(10),
            )
          ],
        ),
      )


    );
  }

}