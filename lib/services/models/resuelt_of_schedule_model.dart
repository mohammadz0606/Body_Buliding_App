import 'package:cloud_firestore/cloud_firestore.dart';

class ResueltOfSheduleModel {
  final String userId;
  final int calories;
  double proteinPercentage;
  double carbPercentage;
  double fatPercentage;
  double afterProteinPercentage;
  double afterCarbPercentage;
  double afterFatPercentage;
  final double height;
  final double weight;
  final String gender;
  final String muscular;
  final String activity;
  List<Map<String, dynamic>> finalProteinsItems;
  List<Map<String, dynamic>> finalFatsItems;
  List<Map<String, dynamic>> finalCarbItems;
  ResueltOfSheduleModel({
    required this.userId,
    required this.calories,
    this.proteinPercentage = 0,
    this.carbPercentage = 0,
    this.fatPercentage = 0,
    this.afterProteinPercentage = 0,
    this.afterCarbPercentage = 0,
    this.afterFatPercentage = 0,
    required this.height,
    required this.weight,
    required this.gender,
    required this.muscular,
    required this.activity,
    this.finalProteinsItems = const [],
    this.finalFatsItems = const [],
    this.finalCarbItems = const [],
  });

  factory ResueltOfSheduleModel.fromJson(DocumentSnapshot json) {
    return ResueltOfSheduleModel(
      userId: json["userID"],
      calories: json["calories"],
      afterProteinPercentage: json["afterProteinPercentage"],
      afterCarbPercentage: json["afterCarbPercentage"],
      afterFatPercentage: json["afterFatPercentage"],
      proteinPercentage: json["proteinPercentage"],
      carbPercentage: json["carbPercentage"],
      fatPercentage: json["fatPercentage"],
      height: json["height"],
      weight: json["weight"],
      finalProteinsItems:
          List<Map<String, dynamic>>.from(json["finalProteinsItems"] as List)
              .map((e) {
        return e;
      }).toList(),
      finalFatsItems:
          List<Map<String, dynamic>>.from(json["finalFatsItems"] as List)
              .map((e) {
        return e;
      }).toList(),
      finalCarbItems:
          List<Map<String, dynamic>>.from(json["finalCarbItems"] as List)
              .map((e) {
        return e;
      }).toList(),
      muscular: json["muscular"],
      gender: json["gender"],
      activity: json["activity"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userID": this.userId,
      "calories": this.calories,
      "muscular":this.muscular,
      "gender":this.gender,
      "activity": this.activity,
      "afterProteinPercentage":this.afterProteinPercentage,
      "afterCarbPercentage":this.afterCarbPercentage,
      "afterFatPercentage":this.afterFatPercentage,
      "proteinPercentage": this.proteinPercentage,
      "carbPercentage": this.carbPercentage,
      "fatPercentage": this.fatPercentage,
      "height": this.height,
      "weight": this.weight,
      "finalProteinsItems": this.finalProteinsItems,
      "finalFatsItems": this.finalFatsItems,
      "finalCarbItems": this.finalCarbItems,
    };
  }
}
