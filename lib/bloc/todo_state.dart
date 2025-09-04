// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}


class Loading extends TodoState {}

class Error extends TodoState {}

class SuccessAllTodoCame extends TodoState {
final  List<TodoModel> todos;
  SuccessAllTodoCame({
    required this.todos,
  });
}
