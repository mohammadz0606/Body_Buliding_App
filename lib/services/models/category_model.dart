import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String image;
  final String title;

  const CategoryModel({
    required this.id,
    required this.image,
    required this.title,
  });

  factory CategoryModel.fromMap(QueryDocumentSnapshot map) {
    return CategoryModel(
      id: map["id"],
      image: map["image"],
      title: map["title"],
    );
  }
}
