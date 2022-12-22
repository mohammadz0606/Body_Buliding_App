import 'package:cloud_firestore/cloud_firestore.dart';

class ExcercisesModel {
  final String id;
  final String video;

  factory ExcercisesModel.fromJson(QueryDocumentSnapshot json) {
    return ExcercisesModel(
      id: json["id"],
      video: json["video"],
    );
  }

  const ExcercisesModel({
    required this.id,
    required this.video,
  });
}
