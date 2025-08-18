import 'package:flutter/material.dart';
import 'package:ui_service_model/pages/all_todo_page.dart';
import 'package:ui_service_model/service/todo_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePageWithAlotOfTodos());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: TodoService().getTodo(),
          builder: (context, response) {
            if (response.hasData) {
              print(response.data.runtimeType);
              return ListTile(
                title: Text(response.data!.title),
                subtitle: Text(response.data!.completed.toString()),
              );
            } else if (response.hasError) {
              return Text(response.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

