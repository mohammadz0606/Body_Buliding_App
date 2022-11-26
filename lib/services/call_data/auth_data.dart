import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthData {
  late UserCredential _auth;
  Future<UserCredential> signupApp({
    required String email,
    required String password,
    required String name,
  }) async{
    try {
    return  _auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );//

    } on FirebaseAuthException  catch(e){
      throw Exception(e.message);
    }
  }
}