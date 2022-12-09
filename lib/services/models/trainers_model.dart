import 'package:cloud_firestore/cloud_firestore.dart';

class TrainersModel {
  final String id;
  final String image;
  final String instgram;
  final String name;
  final String tiktok;
  final String whats;

  const TrainersModel({
    required this.id,
    required this.image,
    required this.instgram,
    required this.name,
    required this.tiktok,
    required this.whats,
  });

  factory TrainersModel.fromMap(QueryDocumentSnapshot map) {
    return TrainersModel(
      id: map["id"],
      image: map["image"].toString(),
      instgram: map["instgram"],
      name: map["name"],
      tiktok: map["tiktok"],
      whats: map["whats"],
    );
  }
}
