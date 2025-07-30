import 'package:dio/dio.dart';
import 'package:restapi_intro/restapi_intro.dart';

void main()async {

// ? Service Layer Example
Dio dio = Dio();
Response response =await dio.get('http://jsonplaceholder.typicode.com/todos/1');
print(response);
print(response.data);


// ? Model Layer Example
// print(response.data['title']);
Todo todo = Todo.fromMap(response.data);
print(todo);


// ? Service Layer Example to Handle List of Data 
Response responseAsList =await dio.get('http://jsonplaceholder.typicode.com/todos/');

List<Todo> todos = [];
for (var i = 0; i < responseAsList.data.length; i++) {
  todos.add(Todo.fromMap(responseAsList.data[i]));
}
print(todos);



Response response2 =await dio.get('http://jsonplaceholder.typicode.com/users/1');
print(response2);
print(response2.data);


// ? Model Layer Example
// print(response.data['title']);
User user = User.fromMap(response2.data);
print(user.address.geo.lat);

}