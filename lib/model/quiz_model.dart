// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizModel {
  String question;
  List<Answer> options;
  QuizModel({
    required this.question,
    required this.options,
  });
}


class Answer {
  String answer;
  bool isCorrect;
  Answer({
    required this.answer,
    required this.isCorrect,
  });
}
