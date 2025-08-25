// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:service_solution/model/comment_model.dart';

class CommentModelOrString {
  String message;
  CommentModel? comment;
  CommentModelOrString({
    required this.message,
    required this.comment,
  });
}
