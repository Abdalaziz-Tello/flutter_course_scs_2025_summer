import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/bloc/counter_bloc.dart';
import 'package:state_managment/pages/counter_page_using_bloc.dart';
import 'package:state_managment/pages/counter_page_using_provider.dart';
import 'package:state_managment/provider/counter_provider.dart';

void main() {
  // Things things= Things();
  // things.name.add("Ahmad");

  // Things things1 = Things();
  // print(things1.name);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: CounterPageUsingBloc()),
    );
  }
}

