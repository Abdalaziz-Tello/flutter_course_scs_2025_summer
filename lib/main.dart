import 'package:flutter/material.dart';
import 'package:quiz_app_model/model/quiz_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizPage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(counter.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SimpleHomePage()),
          );
        },
      ),
    );
  }
}

class SimpleHomePage extends StatefulWidget {
  const SimpleHomePage({super.key});

  @override
  State<SimpleHomePage> createState() => _SimpleHomePageState();
}

class _SimpleHomePageState extends State<SimpleHomePage> {
  late int counter;

  @override
  void initState() {
    counter = 0;
    super.initState();
  }

  void _increamentCounter() {
    counter++;
    print(counter);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increamentCounter();
        },
      ),

      appBar: AppBar(
        title: Text("Flutter Demo"),
        backgroundColor: const Color.fromARGB(255, 175, 99, 125),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This Button Has been pushed : ",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

List<QuizModel> quiz = [
  QuizModel(
    question: "What is Your favorite Color ?",
    options: [
      Answer(answer: "Red", isCorrect: true),
      Answer(answer: "Blue", isCorrect: true),
      Answer(answer: "Green", isCorrect: false),
      Answer(answer: "Yellow", isCorrect: false),
    ],
  ),
  QuizModel(
    question: "What is Your favorite Animal ?",
    options: [
      Answer(answer: "Dog", isCorrect: false),
      Answer(answer: "Cat", isCorrect: false),
      Answer(answer: "Bird", isCorrect: true),
      Answer(answer: "Fish", isCorrect: false),
    ],
  ),
  QuizModel(
    question: "What is Your favorite Brand ?",
    options: [
      Answer(answer: "Apple", isCorrect: true),
      Answer(answer: "Samsung", isCorrect: true),
      Answer(answer: "Bird", isCorrect: false),
      Answer(answer: "Fish", isCorrect: false),
    ],
  ),
  QuizModel(
    question: "What is Your favorite Brand ?",
    options: [
      Answer(answer: "Apple", isCorrect: true),
      Answer(answer: "Samsung", isCorrect: true),
      Answer(answer: "Bird", isCorrect: false),
      Answer(answer: "Fish", isCorrect: false),
    ],
  ),
];

// TODO: Add the varabile that handel the score of the User

class QuizPage extends StatelessWidget {
  QuizPage({super.key});
  // ! This code is messy.and must be refactor
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz App")),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: quiz.length,
        itemBuilder: (context, index) => Scaffold(
          body: Column(
            children: [
              ListTile(
                title: Text(quiz[index].question),
                subtitle: Text("${index + 1} / ${quiz.length}"),
              ),
              Container(
                height: 500,
                child: GridView.builder(
                  itemCount: quiz[index].options.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),

                  itemBuilder: (context, ind) => InkWell(
                    onTap: () {
                      // ? How to Add Navigation and what is the condintion must have ?
                      if (quiz[index].options[ind].isCorrect) {
                        print("Bravo");
                        controller.nextPage(
                          duration: Duration(seconds: 2),
                          curve: Curves.bounceOut,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                            content: Text("Yayyyyyyyy ! 😊"),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        controller.nextPage(
                          duration: Duration(seconds: 2),
                          curve: Curves.bounceOut,
                        );

                        // TODO: Add here the logic of adding question to Solution Array
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                            content: Text("Sorry You Screwed Up !"),
                            duration: Duration(seconds: 6),
                          ),
                        );
                        print("Not Bravo");
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade300,
                      ),
                      child: Center(
                        child: Text(
                          quiz[index].options[ind].answer,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
