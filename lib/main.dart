import 'package:flutter/material.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Row Column",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Row & Column"),
          ),
          body:
              Column(
                children: [
                  const Text("MainAxisAlignment.spaceEvenly"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.share),
                      Icon(Icons.thumb_up),
                      Icon(Icons.thumb_down)
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("MainAxisAlignment.spaceAround"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.share),
                      Icon(Icons.thumb_up),
                      Icon(Icons.thumb_down)
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("MainAxisAlignment.spaceBetween"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.share),
                      Icon(Icons.thumb_up),
                      Icon(Icons.thumb_down)
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("MainAxisAlignment.start"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.share),
                      Icon(Icons.thumb_up),
                      Icon(Icons.thumb_down)
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("MainAxisAlignment.center"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.share),
                      Icon(Icons.thumb_up),
                      Icon(Icons.thumb_down)
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("MainAxisAlignment.end"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.share),
                      Icon(Icons.thumb_up),
                      Icon(Icons.thumb_down)
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: const [
                      Text("Sebuah Judul", style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Text("Lorem ipsum dolor sit amet")
                    ],
                  )
                ],
              )
          ),
        );
  }
}
