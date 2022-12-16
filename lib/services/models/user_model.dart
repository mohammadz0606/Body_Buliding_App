import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  final String name;
  final String email;

  UserModel({
    this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "id":id,
      "name": name,
      "email": email,
    };
  }

  factory UserModel.fromMap(map) {
    return UserModel(
      id: map["id"],
      name: map["name"],
      email: map["email"],
    );
  }
}
