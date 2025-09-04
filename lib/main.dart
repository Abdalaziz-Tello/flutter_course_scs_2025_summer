import 'package:bloc_in_clean_arch/bloc/todo_bloc.dart';
import 'package:bloc_in_clean_arch/config/obserber_config.dart';
import 'package:bloc_in_clean_arch/service/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

// ! Root Page (Root context)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc(
          serviceImp: TodoServiceImpWithCach()
        )),
      ],
      child: MaterialApp(home: TodoPage()),
    );
  }

  // ? can read Bloc Object from this context
}

// ? Node Page
class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Amir Page")),

      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is SuccessAllTodoCame) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) => ListTile(
                selected: state.todos[index].completed,
                selectedColor: Colors.green.shade300,
                title: Text(state.todos[index].title),
              ),
            );
          } else if (state is Error) {
            return Center(
              child: Text("There is a Problem With Your Connecntion"),
            );
          } else
          if (state is Loading)
          {
            return Center(child: LinearProgressIndicator());
            } else {
              return Center(
                child: Text("Please Click the button to get all todos"),
              );
          }
        },
      ),
      floatingActionButton: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sorry for that 🥹"),backgroundColor: Colors.blue,behavior: SnackBarBehavior.floating,));
          }
        },
        child: FloatingActionButton(
          onPressed: () {
            context.read<TodoBloc>().add(GetAllTodo());
          },
        ),
      ),
    );
  }
}

// ? Node Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Temp Page")),

      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is Loading) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sorry for that 🥹"),backgroundColor: Colors.blue,behavior: SnackBarBehavior.floating,));
         
          }
        },
        builder: (context, state) {
          if (state is SuccessAllTodoCame) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) => ListTile(
                selected: state.todos[index].completed,
                selectedColor: Colors.green.shade300,
                title: Text(state.todos[index].title),
              ),
            );
          } else if (state is Error) {
            return Center(
              child: Text("There is a Problem With Your Connecntion"),
            );
          } else
          // if (state is Loading)
          {
            return Center(child: LinearProgressIndicator());
            // } else {
            //   return Center(
            //     child: Text("Please Click the button to get all todos"),
            //   );
          }
        },
      ),
      );
  }
}
