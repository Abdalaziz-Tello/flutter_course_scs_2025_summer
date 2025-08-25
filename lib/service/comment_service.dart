import 'package:dio/dio.dart';
import 'package:service_solution/model/comment_model.dart';
import 'package:service_solution/model/solution_number_one.dart';

class CommentService {
  Dio dio = Dio();
  late Response response;
  String baseurl = "http://jsonplaceholder.typicode.com/comments/1";

  Future<CommentModelOrString> getOneComment() async {
    try {
      response = await dio.get(baseurl);
      CommentModel comment = CommentModel.fromMap(response.data);
      return CommentModelOrString(message: "", comment: comment);
    } catch (e) {
      print(e);
      return CommentModelOrString(message: "There is No Data", comment:null );
    }
  }
}
