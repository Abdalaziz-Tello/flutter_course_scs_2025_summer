// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CommentModel {
  String name;
  String email;
  String body;
  CommentModel({
    required this.name,
    required this.email,
    required this.body,
  });

  CommentModel copyWith({
    String? name,
    String? email,
    String? body,
  }) {
    return CommentModel(
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) => CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CommentModel(name: $name, email: $email, body: $body)';

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.body == body;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ body.hashCode;
}
