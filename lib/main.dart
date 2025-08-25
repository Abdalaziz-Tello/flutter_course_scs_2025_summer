import 'package:flutter/material.dart';
import 'package:service_solution/model/comment_model.dart';
import 'package:service_solution/model/solution_number_one.dart';
import 'package:service_solution/service/comment_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePageWithServiceLayer());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: getNumbers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);

              return Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 32),
              );
            } else {
              return LinearProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Stream<int> getNumbers() async* {
  // int temp = 0;
  for (var i = 0; i < 10000; i++) {
    await Future.delayed(Duration(seconds: 1));
    // temp = i;
    yield i;
  }
}

class HomePageWithNotifing extends StatelessWidget {
  HomePageWithNotifing({super.key});

  ValueNotifier<int> counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: counter,
          builder: (context, value, child) {
            return Text(value.toString(), style: TextStyle(fontSize: 32));
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
      ),
    );
  }
}

class HomePageWithBuilder extends StatelessWidget {
  HomePageWithBuilder({super.key});
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StatefulBuilder(
          builder: (context, setstate) {
            return InkWell(
              onTap: () {
                counter++;
                setstate((){});
              },

              child: Text(counter.toString(), style: TextStyle(fontSize: 32)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // counter++;
          // print(counter);
        },
      ),
    );
  }
}


class HomePageWithServiceLayer extends StatelessWidget {
   HomePageWithServiceLayer({super.key});

  CommentService commentService =CommentService();
  ValueNotifier<ResultModel> comment = ValueNotifier(ResultModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ValueListenableBuilder(
        valueListenable: comment,
        builder: (context, value, child) {
          
          if (value is ErrorModel) {
            return Text(value.message);
          }
          if (value is CommentModel) {
            
          return ListTile(
            title: Text(value.name),
            subtitle: Text(value.body),
          );
        }
          return LinearProgressIndicator();
          }
      ),),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        comment.value=await commentService.getOneComment();
      }),
    );
  }
}