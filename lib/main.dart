import 'package:flutter/material.dart';

void main() {
  run(animal: Haski());
  runApp(SecondPage());
}

class Animal {}

class Dog extends Animal {}

class Haski extends Dog {}

run({required Animal animal}) {}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // floatingActionButton: Center(child: Text("Hello World")),
        // bottomNavigationBar: Center(child: Text("Hello World")),
        // body: Center(child: Text("Hello World")),
        body: Image.network("https://avatars.githubusercontent.com/u/50756563"),
        appBar: AppBar(
          centerTitle: true,
          actions: [FlutterLogo()],
          title: Text("Hello World From First App"),
          leading: FlutterLogo(),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "DUOLINGO",
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 94, 243, 99),
      ),
    );
  }
}
