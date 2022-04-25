import 'package:flutter/material.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Input",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Input"),
          ),
          body: ListView(children:  const [
            Padding(
              padding: EdgeInsets.all(16),
              child: InputTextField(),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: InputSwitch(),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: InputRadio(),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: InputCheckbox(),
            ),
          ])),
    );
  }
}

class InputTextField extends StatefulWidget {
  const InputTextField({Key? key}) : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
              hintText: "Write your name here...", labelText: "Your Name"),
          onChanged: (String value) {
            setState(() {
              _name = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Hello, $_name!"),
                    );
                  });
            },
            child: const Text("Submit"))
      ],
    );
  }
}

class InputSwitch extends StatefulWidget {
  const InputSwitch({Key? key}) : super(key: key);

  @override
  _InputSwitchState createState() => _InputSwitchState();
}

class _InputSwitchState extends State<InputSwitch> {
  bool lightOn = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
     leading: Switch(
        value: lightOn,
        onChanged: (bool value) {
          setState(() {
            lightOn = value;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(lightOn ? "Light ON" : "Light OFF"),
            duration: const Duration(seconds: 1),
          ));
        }),
      title: const Text("Turn The Light"),
    );
  }
}

class InputRadio extends StatefulWidget {
  const InputRadio({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputRadioState();
}

class _InputRadioState extends State<InputRadio> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio(
            value: "Dart",
            groupValue: language,
            onChanged: (String? value) {
              setState(() {
                language = value;
                showSnackbar();
              });
            },
          ),
          title: const Text("Dart"),
        ),
        ListTile(
          leading: Radio(
            value: "Kotlin",
            groupValue: language,
            onChanged: (String? value) {
              setState(() {
                language = value;
                showSnackbar();
              });
            },
          ),
          title: const Text("Kotlin"),
        ),
        ListTile(
          leading: Radio(
            value: "Swift",
            groupValue: language,
            onChanged: (String? value) {
              setState(() {
                language = value;
                showSnackbar();
              });
            },
          ),
          title: const Text("Swift"),
        )
      ],
    );
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$language selected"),
      duration: const Duration(seconds: 1),
    ));
  }
}

class InputCheckbox extends StatefulWidget {
  const InputCheckbox({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputCheckboxState();
}

class _InputCheckboxState extends State<InputCheckbox> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
          value: agree,
          onChanged: (bool? value) {
            setState(() {
              agree = value!;
              showSnackbar();
            });
          }),
      title: const Text("Click to Agree / Disagree"),
    );
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(agree ? "I agree" : "I disagree"),
      duration: const Duration(seconds: 1),
    ));
  }
}
