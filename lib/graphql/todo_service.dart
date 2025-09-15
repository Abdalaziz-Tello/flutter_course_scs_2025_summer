


import 'package:graph_map_beyond_flutter/graphql/gql.dart';
import 'package:graph_map_beyond_flutter/graphql/graphql_init.dart';
import 'package:graph_map_beyond_flutter/model/todo_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future<List<TodoModel>>  getAllPosts()async{
  try {
    
  // ? Dio dio = Dio()
  GraphQLClient client = initGraphql();
  // ! dio.get()
  final response =await client.query(QueryOptions(document: gql(todoDocument)));
  List<TodoModel> todos = [];
  print(response.data);
  for (var i = 0; i < response.data!['user']['posts']['data'].length; i++) {
    todos.add(TodoModel.fromMap(response.data!['user']['posts']['data'][i]));
  }
  return todos;
  } catch (e) {
    print(e);
    rethrow;
  }
}