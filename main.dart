import 'temp_varaibles.dart';

int counter = 0;

void main(List<String> args) {
  // ? What is the Varabile
  String messageOfMyPrograme = "Hello World";
  print(messageOfMyPrograme.runtimeType);

  counter++;
  print(counter.runtimeType);

  // ? What is the complex type (bool + Null)
  bool? isFavorite;
  print(isFavorite);

  print(newMessage);

  // ? Null as Type
  Null nothing = null;
  int degree = 20;
  // degree ="20";

  // ? Complex ( int + Null) type
  int? shoMaKan = 20;
  print(shoMaKan.runtimeType);
  shoMaKan = null;

  print(shoMaKan.runtimeType);
  shoMaKan = 20;

  // ? What is The dynamic and differnt from "var"
  dynamic iAmAnything = "HA Ha Ha";
  print(iAmAnything.runtimeType);
  iAmAnything = 200000;
  print(iAmAnything.runtimeType);
  iAmAnything = "ForeEver";
  print(iAmAnything.runtimeType);
  iAmAnything = true;
  print(iAmAnything.runtimeType);

  // ? Final can be DECLARE whithout INILAIZE
  final userName;
  // print(userName.runtimeType);
  userName = "dksalkdsa;kdsa";
  print(userName.runtimeType);
  // userName = "Hello";

  // ! CONST MUST BE DECLARED AND INILIZAED
  // ! This is a Bad Example for const modifier
  // const nickName;
  // print(nickName.runtimeType);
  // nickName="dsajkldsa";
  // print(nickName);
  // nickName="Hello";
}
