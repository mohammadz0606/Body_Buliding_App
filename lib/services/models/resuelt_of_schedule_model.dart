import 'package:cloud_firestore/cloud_firestore.dart';

class ResueltOfSheduleModel {
  final String userId;
  final int calories;
  final double proteinPercentage;
  final double carbPercentage;
  final double fatPercentage;
  final int age;
  final double height;
  final double weight;
  final List<Map<String, dynamic>> finalProteinsItems;
  final List<Map<String, dynamic>> finalFatsItems;
  final List<Map<String, dynamic>> finalCarbItems;

  const ResueltOfSheduleModel({
    required this.userId,
    required this.calories,
    required this.proteinPercentage,
    required this.carbPercentage,
    required this.fatPercentage,
    required this.age,
    required this.height,
    required this.weight,
    required this.finalProteinsItems,
    required this.finalFatsItems,
    required this.finalCarbItems,
  });

  factory ResueltOfSheduleModel.fromJson(QueryDocumentSnapshot json) {
    return ResueltOfSheduleModel(
      userId: json["userID"],
      calories: int.parse(json["calories"]),
      proteinPercentage: double.parse(json["proteinPercentage"]),
      carbPercentage: double.parse(json["carbPercentage"]),
      fatPercentage: double.parse(json["fatPercentage"]),
      age: int.parse(json["age"]),
      height: double.parse(json["height"]),
      weight: double.parse(json["weight"]),
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userID":this.userId,
      "calories": this.calories,
      "proteinPercentage": this.proteinPercentage,
      "carbPercentage": this.carbPercentage,
      "fatPercentage": this.fatPercentage,
      "age": this.age,
      "height": this.height,
      "weight": this.weight,
      "finalProteinsItems": this.finalProteinsItems,
      "finalFatsItems": this.finalFatsItems,
      "finalCarbItems": this.finalCarbItems,
    };
  }
}
