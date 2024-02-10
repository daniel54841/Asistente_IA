import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/net/login_firebase.dart';

class LoginController extends GetxController {
  bool isRepeat = true;

  void updateLogo(bool value) {
    isRepeat = value;
    update();
  }

  late BuildContext context;

  ///Inicializacion de operaciones que corresponden con firebase(Auth)
  final LoginFirebase _operations = LoginFirebase();

  //Metodos que consumen los metodos definidos en login_firebase
  ///TODO: pelearse con los dialogos para mostrar alertDialog cuando ocurra un error

  void signInWithEmailAndPassword(String user, String password) async {
    try {
      if (_checkUser(user) == "" && _checkPassword(password) == "") {
        String? result = await _operations.login(user, password);
        if (result != null) {
          if (result == "Success") {
            Get.offAndToNamed("home");
          }
        }
      } else {
        throw ("Usuario o contraseña no cumplen con requisitos.");
      }
    } catch (e) {
      debugPrint("Exception in signInWithEmailAndPassword: " + e.toString());
    }
  }

  String _checkUser(String user) {
    if (user.isNotEmpty) {
      if (user.isEmail) {
        return "";
      } else {
        return "no valido";
      }
    } else {
      return "vacio";
    }
  }

  String _checkPassword(String password) {
    if (password.isNotEmpty) {
      if (password.length > 1 && password.length < 10) {
        return "";
      } else {
        return "no valido";
      }
    } else {
      return "vacio";
    }

    return "";
  }
}
