import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthData {
  late UserCredential _auth;
  Future signupApp({
    required String email,
    required String password,
    required String name,
  }) async{
    try {
      log('5');

      _auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );//
      log('6');
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (e.code == 'weak-password') {
        // _errorMassage = 'The password provided is too weak.';
        log(e.code.toString());
      } else if (e.code == 'email-already-in-use') {
        //_errorMassage = 'The account already exists for that email.';
        log(e.code.toString());
      }
    }catch(e){
      log(e.toString());

      throw Exception(e.toString());
    }
  }
}