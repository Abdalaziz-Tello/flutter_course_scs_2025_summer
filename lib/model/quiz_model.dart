// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizModel {
  String question;
  List<Answer> answers;

  QuizModel({
    required this.answers,
    required this.question,
  });
}


class Answer {
  String answerTitle;
  bool isCorrect;
  Answer({
    required this.answerTitle,
    required this.isCorrect,
  });
}
