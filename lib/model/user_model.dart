import 'package:meta/meta.dart';
import 'dart:convert';

class UserModel {
    final int id;
    final String username;
    final String email;
    final String firstName;
    final String lastName;
    final String gender;
    final String image;

    UserModel({
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
    });

    UserModel copyWith({
        int? id,
        String? username,
        String? email,
        String? firstName,
        String? lastName,
        String? gender,
        String? image,
    }) => 
        UserModel(
            id: id ?? this.id,
            username: username ?? this.username,
            email: email ?? this.email,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            gender: gender ?? this.gender,
            image: image ?? this.image,
        );

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
    };
}
