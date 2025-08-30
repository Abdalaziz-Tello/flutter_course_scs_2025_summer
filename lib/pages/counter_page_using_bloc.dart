import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/bloc/counter_bloc.dart';
import 'package:state_managment/bloc/counter_event.dart';
import 'package:state_managment/bloc/counter_state.dart';

class CounterPageUsingBloc extends StatelessWidget {
  const CounterPageUsingBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is TheNumberChanged) {
              return Text(state.counter.toString());
            } else {
              return Text("0");
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(Increament());
        },
      ),
    );
  }
}
