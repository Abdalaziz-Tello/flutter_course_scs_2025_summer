import 'package:flutter/material.dart';
import 'package:graph_map_beyond_flutter/graphql/todo_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await initHiveForFlutter();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(future: getAllPosts(), builder:(context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => 
             Text(snapshot.data![index].title,style: TextStyle(fontSize: 28),),);
          } else {
            return CircularProgressIndicator();
          }
        },),
      ),
    );
  }
}