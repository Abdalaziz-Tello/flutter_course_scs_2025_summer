import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_in_clean_arch/model/todo_model.dart';
import 'package:bloc_in_clean_arch/service/todo_service.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> todos = [];
  TodoService serviceImp= TodoServiceImpWithCach();
  TodoBloc(
    {required this.serviceImp,}
  ) : super(TodoInitial()) {
    on<GetAllTodo>((event, emit)async {
        emit(Loading());
        todos = await serviceImp.getAllTodo();
        if (todos.isEmpty) {
          emit(Error());
        } else {
          emit(SuccessAllTodoCame(todos: todos));
        }
    });
  }
}
