import 'package:dio/dio.dart';
import 'package:ui_service_model/model/todo_model.dart';


class TodoService {

// ? init service layer
Dio dio = Dio();
// // ? init service layer
//   Dio dio = Dio();
String baseUrl = "http://jsonplaceholder.typicode.com/todos";

late Response response;

Future<TodoModel> getTodo() async {
  // ? connect with server
   response = await dio.get("${baseUrl}/1");

  // ? Json Serilzation
  TodoModel todo = TodoModel.fromMap(response.data);
  return todo;
}

Future<List<TodoModel>> getTodos() async {
  // ? connect with server
   response = await dio.get(baseUrl);

  // ? Json Serilzation
  List<TodoModel> todos = [];
  for (var i = 0; i < response.data.length; i++) {
    TodoModel todo = TodoModel.fromMap(response.data[i]);
    todos.add(todo);
  }
  return todos;
}

}