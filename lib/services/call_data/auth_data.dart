import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthData {
  UserCredential? _auth;

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
      email: email,
      bio: "write your bio......",
      image:
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
      id: _auth?.user!.uid,
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
      return  await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
