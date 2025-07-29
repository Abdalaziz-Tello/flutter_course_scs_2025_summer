// ignore_for_file: public_member_api_docs, sort_constructors_first
class Human {
  String _name = "";
  String password;
  String job;
  DateTime birthDate;

  Human({required this.birthDate, required this.job, required this.password});

  String getName() {
    if (_name == "") {
      throw Exception("Please Set the name First With setName method");
    } else {
      return _name;
    }
  }

  void setName(String name) {
    if (name.contains(RegExp(r"[0-9]"))) {
      throw Exception("Please Dont etner Number just Alphabit");
    } else {
      name = name.toUpperCase();
      if (job == "Doctor") {
        _name = "Dr." + name;
      } else {
        _name = name;
      }
    }
  }

  double getAge() {
    return DateTime.now().difference(birthDate).inDays / 365;
  }
}


abstract class Animal {
  String name;
  int id;
  // String type;
  
  String color;
  Animal({
    required this.name,
    required this.id,
    // required this.type,
    required this.color,
  });

  walk(){
    print("${id} .  I am ${name} my color is ${color} ,this animal can walk. ${this.runtimeType} ");
  }

  abstractFunctionAsExample();
  
}


class Dog extends Animal {
String type;
  Dog({
    required super.color,
    required super.id,
    required super.name,
    required this.type,
  });
  
  @override
  abstractFunctionAsExample() {
    print("Here a Dog");
  }
}


class Fish extends Animal {
  String type;
  Fish({required this.type,required super.name, required super.id, required super.color});

@override
  walk() {
    throw Exception("Sorry there is no fish can walk, please call swim function ");
  }

  swim(){
    print("Bk Bk Bk");
  }

  @override
  abstractFunctionAsExample() {
    print("Here a Fish");
  }

}




class User {
  String name;
  User._({
    required this.name,
  });

static  User _user = User._(name: "Ahmad");

 static getThePrivateObject(){
    return _user;
  }



  // @override
  // bool operator ==(covariant User other) {
  //   if (identical(this, other)) return true;
  
  //   return 
  //     other.name == name;
  // }

  // @override
  // int get hashCode => name.hashCode;
}
