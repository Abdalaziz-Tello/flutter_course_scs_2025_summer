part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}


class GetAllTodo extends TodoEvent {}