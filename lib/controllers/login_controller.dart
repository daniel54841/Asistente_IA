import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/net/login_firebase.dart';
import 'package:reproductor_ia/widgets/dialogs/error_custom_dialog.dart';

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

  Future<void> signInWithEmailAndPassword(String user, String password) async {
    try {
      bool userOk = await _checkUser(user) == "ok";
      bool passOk = await _checkPassword(password) == "ok";
      if (userOk && passOk) {
        /*   await LoadingCustomDialog.loadingDialog();*/
        String? result = await _operations.login(user, password);
        if (result != null) {
          if (result == "Success") {
            Get.back();
            Get.offAndToNamed("home");
          }
        }
      } else {
        await ErrorCustomDialog.errorDialog(
            "No se ha introducido ningun valor.\nVuelve a intentarlo.");
      }
    } catch (e) {
      debugPrint("Exception in signInWithEmailAndPassword: " + e.toString());
    }
  }

  Future<String> _checkUser(String user) async {
    if (user.isNotEmpty) {
      if (user.isEmail) {
        return "ok";
      } else {
        //no valiod
        await ErrorCustomDialog.errorDialog(
            "Correo introducido no valido.\nVuelve a intentarlo.");

        return "";
      }
    } else {
      //vacio
      await ErrorCustomDialog.errorDialog(
          "No se ha introducido ningun correo.\nEs necesario introducir uno valido para iniciar sesion");
      return "";
    }
  }

  Future<String> _checkPassword(String password) async {
    if (password.isNotEmpty) {
      if (password.length > 1 && password.length < 10) {
        return "ok";
      } else {
        await ErrorCustomDialog.errorDialog(
            "Contraseña no valida, supera la longitud permitida.\nVuelve a intentarlo.");

        return "";
      }
    } else {
      //vacio
      await ErrorCustomDialog.errorDialog(
          "No se ha introducido ninguna contraseña."
          "\nEs necesario introducir una valida para iniciar sesion");

      return "";
    }
  }
}
