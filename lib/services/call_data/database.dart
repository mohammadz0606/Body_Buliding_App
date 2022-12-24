import 'dart:io';

import 'package:body_building/services/models/category_model.dart';
import 'package:body_building/services/models/trainers_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/excercises_model.dart';
import '../models/user_model.dart';

class Database {
  UserCredential? _auth;
  Reference _reference = FirebaseStorage.instance.ref();
  String defaultImage =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";

  Future<UserCredential> signupApp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      return _auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ); //

    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserCredential> signInApp({
    required String email,
    required String password,
  }) async {
    try {
      return _auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> setDataForeFireStore({
    required String email,
    required String password,
    required String name,
  }) async {
    final UserModel userModel = UserModel(
      name: name,
      email: email.toLowerCase(),
      id: _auth?.user!.uid,
      userImage: defaultImage,
    );
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_auth?.user!.uid)
          .set(
            userModel.toMap(),
          );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DocumentSnapshot> getDataForeFireStore() async {
    try {
      return await FirebaseFirestore.instance
          .collection("users")
          .doc(
            FirebaseAuth.instance.currentUser!.uid,
          )
          .get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<TrainersModel>> getTrainers() async {
    List<TrainersModel> trainer = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("trainersCol").get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        trainer.add(
          TrainersModel.fromMap(
            querySnapshot.docs[i],
          ),
        );
      }
      return trainer;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<CategoryModel>> getCategory() async {
    List<CategoryModel> category = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("categoresCol").get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        category.add(CategoryModel.fromMap(querySnapshot.docs[i]));
      }
      return category;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ExcercisesModel>> getAllExcercises() async {
    List<ExcercisesModel> excercies = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("excercisesCol").get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        excercies.add(ExcercisesModel.fromJson(querySnapshot.docs[i]));
      }
      return excercies;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> uploadImageProfileInFireStorage({
    required File profileImage,
    required String userImage,
  }) async {
    String path =
        "usersProfileImage/${Uri.file(profileImage.path).pathSegments.last}";

    await _reference.child(path).putFile(profileImage);

    final String getStorageImageProfileUrl =
        await _reference.child(path).getDownloadURL();

    if (userImage != defaultImage) {
      FirebaseStorage.instance.refFromURL(userImage).delete();
    }
    return getStorageImageProfileUrl;
  }

  Future<void> updateData({
    required UserModel userModel,
    required String newImage,
  }) async {
    UserModel newUserModel = UserModel(
      name: userModel.name,
      email: userModel.email,
      userImage: newImage,
      id: userModel.id,
    );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userModel.id)
        .update(newUserModel.toMap());

    await getDataForeFireStore();
  }
}
