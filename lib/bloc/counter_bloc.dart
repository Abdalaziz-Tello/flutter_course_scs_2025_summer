

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/bloc/counter_event.dart';
import 'package:state_managment/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
int counter = 0;


CounterBloc():super(InitState()){
on<Increament>((event, emit) {
  print("object");
  counter++;
  print(counter);
  emit(TheNumberChanged(counter: counter));
},);
}




}