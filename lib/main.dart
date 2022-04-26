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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Row(
          children: [
            Expanded(child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraint) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "MediaQuery: ${screenSize.width.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "LayoutBuilder: ${constraint.maxWidth}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            })),
            Expanded(
                flex: 3,
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraint) {
                  return Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "MediaQuery: ${screenSize.width.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.blueGrey, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "LayoutBuilder: ${constraint.maxWidth}",
                            style: const TextStyle(
                                color: Colors.blueGrey, fontSize: 18),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ));
                }))
          ],
        ));
  }
}
