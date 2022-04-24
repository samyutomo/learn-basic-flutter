import 'package:flutter/material.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Container",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("First Screen"),
          ),
          body: Column(
            children: [
              Container(
                child: const Text("Hi", style: TextStyle(fontSize: 40),),
                decoration: const BoxDecoration(color: Colors.red),
              ),
              Container(
                child: const Text("Hi", style: TextStyle(fontSize: 40),),
                decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle),
              ),
              Container(
                child: const Text("Hi", style: TextStyle(fontSize: 40),),
                decoration: const BoxDecoration(
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(3, 6),
                          blurRadius: 10)
                ]),
              ),
              Container(
                  child: const Text("Hi", style: TextStyle(fontSize: 40),),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.green, width: 3))),
              Container(
                  child: const Text("Hi", style: TextStyle(fontSize: 40),),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.green, width: 3),
                      borderRadius: BorderRadius.circular(10)))
            ],
          ),
        ));
  }
}
