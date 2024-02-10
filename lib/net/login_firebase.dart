import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

/**
 * Clase que servirá para definir
 * los metodos para controlar el login de firebase
 * */

class LoginFirebase {
  Future<String?> login(String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      debugPrint("Exception in login with LoginFirebase: " + e.toString());
      return e.toString();
    }
  }
}
