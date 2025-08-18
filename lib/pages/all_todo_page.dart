
import 'package:flutter/material.dart';
import 'package:ui_service_model/service/todo_service.dart';

class HomePageWithAlotOfTodos extends StatelessWidget {
  const HomePageWithAlotOfTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(future: TodoService().getTodos(), builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              // separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data!.length,
              itemBuilder: 
               (context, index) => Card(
                 child: ListTile(
                  leading: CircleAvatar(child: Text((index+1).toString())),
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].completed.toString()),
                               ),
               ) ,
              );
          } else if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }else{
            return LinearProgressIndicator();
          }
        },),
      ),
    );
  }
}