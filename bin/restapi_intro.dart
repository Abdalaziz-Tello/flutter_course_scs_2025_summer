import 'dart:io';

import 'package:restapi_intro/restapi_intro.dart';

void main() async {
  Future<String> newMessage = stayTuned();

  // ? #2
  // String message =await stayTuned();

  print("object");
  // ? #3
  print(newMessage);

  // ? #2
  // print(message);

  // ? #1
  // print(await stayTuned());

  Object ob = Object();
  print(ob);

  Human human = Human(name: "Majd");
  print(human);
  print(human.toMap());
  Map<String,dynamic> newMajd = {
    "name":"Majodete"
  };
  File file = File(Directory.current.path+"/test.txt");
  file.writeAsString(human.toString());
  Human human1 = Human.fromMap(newMajd);
  print(human1);

  Function helpMe;
  helpMe = (String message) {
    print("New Help for you , ${message}");
  };

  List<int> someNumbers = [100,200,300];

  someNumbers.forEach((element){
    print(element);
  });

  helpMe("Hello Hello");

  // ?  New Behavior
  Function added = (int a) {
    print(a + 1);
  };

  // ? New behavior
  Function subbed = (int a) {
    print(a - 1);
  };
  doAnything([1, 2, 3], added);

  doAnything([1, 2, 3], subbed);

  // ? Put print in doAnything to show the result
  doAnything([1, 2, 3], (a) => a + 1);
}

// ? Main Function With Diffrenet Behavior
doAnything(List<int> numbers, dynamic doSomething) {
  for (var element in numbers) {
    doSomething(element);
  }
}

Future<String> stayTuned() async {
  await Future.delayed(Duration(seconds: 2));
  return "Hello World";
}
