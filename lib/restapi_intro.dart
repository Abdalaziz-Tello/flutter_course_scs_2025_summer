// ignore_for_file: public_member_api_docs, sort_constructors_first

// ? Modeling a json From Server Side
class Todo {
  int userId;
  int id;
  String title;
  bool completed;
  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  static fromMap(Map<String,dynamic> map){
    return Todo(userId: map['userId'], id: map['id'], title: map['title'], completed: map['completed']);
  }

  @override
  String toString() {
    return "title : ${title} , id : ${id}  completed: ${completed}";
  }
}


class Company {
  String name;
  Company({
    required this.name,
  });


static fromMap(Map<String,dynamic> map){
return Company(name: map['name']);
}
}



class Address {
  String city;
  Geo geo;
  Address({
    required this.city,
    required this.geo,
  });


static fromMap(Map<String,dynamic> map){
return Address(city: map['city'],geo: Geo.fromMap(map['geo']));
}
}

class Geo {
  String lat;
  Geo({
    required this.lat,
  });

  static fromMap(Map<String,dynamic> map){
return Geo(lat: map['lat']);
  }
}


class User {
  String username;
  Company company;
  Address address;
  User({
    required this.username,
    required this.company,
    required this.address,
  });

  static fromMap(Map<String,dynamic> map){
    return User(username: map['username'],
    address: Address.fromMap(map['address']),
    company: Company.fromMap(map['company'])
    );
  }

  @override
  String toString() => 'User(username: $username, company: $company, address: $address)';
}
