// ignore_for_file: public_member_api_docs, sort_constructors_first


abstract class CounterState {} 


class InitState extends CounterState {}


class TheNumberChanged extends CounterState {
  int counter;
  TheNumberChanged({
    required this.counter,
  });
}
