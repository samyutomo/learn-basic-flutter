import 'package:flutter/material.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Button",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Button"),
          ),
          body: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // action when clicked
                  },
                  child: const Text("Elevated Button")),
              TextButton(
                  onPressed: () {
                    // action when clicked
                  },
                  child: const Text("Text Button")),
              OutlinedButton(
                  onPressed: () {
                    // action when clicked
                  },
                  child: const Text("Outlined Button")),
              IconButton(
                onPressed: () {
                  // action when clicked
                },
                icon: const Icon(Icons.volume_up),
                tooltip: "Increase volume by 10",
              ),
              const DropDownButton()
            ],
          )),
    );
  }
}

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButton();
}

class _DropDownButton extends State<DropDownButton> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        items: const [
          DropdownMenuItem(value: "Dart", child: Text("Dart")),
          DropdownMenuItem(value: "Kotlin", child: Text("Kotlin")),
          DropdownMenuItem(value: "Swift", child: Text("Swift"))
        ],
        value: language,
        hint: const Text("Select Language"),
        onChanged: (String? value) {
          setState(() {
            language = value;
          });
        });
  }
}
