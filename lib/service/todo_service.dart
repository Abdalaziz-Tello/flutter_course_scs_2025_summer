import 'dart:developer';

import 'package:bloc_in_clean_arch/model/todo_model.dart';
import 'package:bloc_in_clean_arch/service/base_service.dart';

abstract class TodoService extends BaseService {
  Future<List<TodoModel>> getAllTodo();
}

class   TodoServiceImpWithCach extends TodoService {
  List<TodoModel> todos = [];
  @override
  Future<List<TodoModel>> getAllTodo() async {
    try {
      if (todos.isNotEmpty) {
        log("From Cach");
        return todos;
      } 
      log("From Server");
      response = await dio.get(baserurl);
      log("Here the serivce Impl ");
      todos = List.generate(
        response.data.length,
        (index) => TodoModel.fromMap(response.data[index]),
      );
      return todos;
    } catch (e) {
      log("Here the Handling Impl ");
      print(e);
      return [];
    }
  }
}




class TodoServiceImp extends TodoService {
  
  @override
  Future<List<TodoModel>> getAllTodo() async {
    try {
      
      log("From Server");
      response = await dio.get(baserurl);
      log("Here the serivce Impl ");
     return List.generate(
        response.data.length,
        (index) => TodoModel.fromMap(response.data[index]),
      );
      
    } catch (e) {
      log("Here the Handling Impl ");
      print(e);
      return [];
    }
  }
}

