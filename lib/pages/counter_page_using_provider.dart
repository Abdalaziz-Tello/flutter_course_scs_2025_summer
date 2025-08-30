
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/provider/counter_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextField(
        onChanged: (value) {
          context.read<CounterProvider>().updateCounterValue(value);
        },
      ),),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) {
            return Text(value.counter.toString(),style: TextStyle(fontSize: 32),);
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<CounterProvider>().increament();

        // ! May cause error becauce it is getter without setter
        // context.read<CounterProvider>().counter=1;
      }),
    );
  }
}