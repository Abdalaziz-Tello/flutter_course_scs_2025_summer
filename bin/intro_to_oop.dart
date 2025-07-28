import 'package:intro_to_oop/intro_to_oop.dart';

void main(List<String> arguments) {
  // List<int> numbers = [1,2,3,4];
  // numbers.add("5");
// int number = 20;


//   String name;
//   name = "Hello";

//   Human human;
//   human = Human(birthDate: DateTime(1980), job: "Doctor", password: "0946562259");
//   human.setName("noor");
//   print(human.getName());
//   // print(human.);
//   print(human.getAge());

//   // Animal animal = Animal(name: "Turtel", id: 1, color: "Green");
//   // animal.walk();

//   Dog dog = Dog(color: "Black", id: 2, name: "Alex", type: "Haski");
//   dog.walk();

//   // ! Can not be initlize 
//   // Dog dog2 = Animal(name: name, id: id, color: color);
  

//   Animal animal1 = Dog(color: "White", id: 3, name: "Anything", type: "Haski");
//   print((animal1 as Dog).type);

//   animal1.walk();

//   Fish animal2 = Fish(type: "Golden", name: "Nemo", id: 4, color: "Yellow");
//   try {
//   animal2.walk();
    
//   } catch (e) {
//   animal2.swim();
    
//   }
//   print(animal2.runtimeType);
//   animal1.abstractFunctionAsExample();
//   guessTheTypeAndPrintIt(animal2);


// ? OOP on Fire
User user = User.getThePrivateObject();
User user1 = User.getThePrivateObject();
if (user1==user) {
  print("Match");
  } else {
  print("Not Match");
}

List numbers = [1,2,3];
List numbers1 = [1,2,3];
print(numbers==numbers1);
}


guessTheTypeAndPrintIt(Animal animal){
if (animal is Dog) {
  print("This is a Dog");
} else {
  print("This is a Fish");
}
}