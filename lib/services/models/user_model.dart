import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  final String name;
  final String email;
  final String userImage;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.userImage,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "userImage": userImage,
    };
  }

  factory UserModel.fromMap(map) {
    return UserModel(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      userImage: map["userImage"]
    );
  }
}
