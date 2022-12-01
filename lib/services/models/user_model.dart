import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  final String name;
  final String email;
  final String bio;
  final String image;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      "id":id,
      "name": name,
      "email": email,
      "bio": bio,
      "image": image,
    };
  }

  factory UserModel.fromMap(map) {
    return UserModel(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      bio: map["bio"],
      image: map["image"],
    );
  }
}
