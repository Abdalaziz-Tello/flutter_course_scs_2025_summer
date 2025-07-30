// ignore_for_file: public_member_api_docs, sort_constructors_first

 class Human {
  String name;
  Human({
    required this.name,
  });


 @override
  String toString() {
return "His name is : ${name}";
  }

 static fromMap(Map<String,dynamic> map){
    return Human(name: map['name']);
  }

  toMap(){
    return {
      "name":name
    };
  }

  // ! We should Have abstract class to Have abstract function
  // toNotString();

 }


// class Teacher extends Human {
//   Teacher({required super.name});
  
//   @override
//   toNotString() {

//   }

// }