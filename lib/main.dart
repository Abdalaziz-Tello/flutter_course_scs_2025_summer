import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';

void main(List<String> args) {
  runApp(MyApp());
}

List<QuizModel> quizes = [
  QuizModel(
    answers: [
      Answer(answerTitle: "20", isCorrect: true),
      Answer(answerTitle: "30", isCorrect: false),
      Answer(answerTitle: "40", isCorrect: false),
      Answer(answerTitle: "50", isCorrect: false),
    ],
    question: "How Old Are You ?",
  ),
  QuizModel(
    answers: [
      Answer(answerTitle: "20", isCorrect: true),
      Answer(answerTitle: "30", isCorrect: false),
      Answer(answerTitle: "40", isCorrect: false),
      Answer(answerTitle: "50", isCorrect: false),
    ],
    question: "How Much do you Have ?",
  ),
  QuizModel(
    answers: [
      Answer(answerTitle: "200000", isCorrect: true),
      Answer(answerTitle: "300000", isCorrect: false),
      Answer(answerTitle: "0", isCorrect: false),
      Answer(answerTitle: "100000", isCorrect: false),
    ],
    question: "How Old Are You ?",
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView.builder(
        // physics
        itemCount: quizes.length,
        itemBuilder: (context, index) => QuizPage(quiz: quizes[index]),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  QuizPage({super.key, required this.quiz});

  QuizModel quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(quiz.question),
          Column(
            children: List.generate(
              quiz.answers.length,
              (index) => InkWell(
                onTap: () {
                  if (quiz.answers[index].isCorrect) {
                    print("correct");
                  } else {
                    print("not correct");
                  }
                },
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(child: Text(quiz.answers[index].answerTitle)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
