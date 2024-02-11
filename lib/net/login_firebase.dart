import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/dialogs/error_custom_dialog.dart';

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
        await ErrorCustomDialog.errorDialog(
            "Email incorrecto. No está asociado a ningun correo guardado.\nIntentelo de nuevo");
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        await ErrorCustomDialog.errorDialog(
            "Contraseña incorrecta.\nIntentelo de nuevo");
        return 'Wrong password provided for that user.';
      } else if (e.code == "user-disabled") {
        await ErrorCustomDialog.errorDialog(
            "Cuenta deshabilitada por el administrador.");
        return "The given email has been disabled";
      }
      {
        await ErrorCustomDialog.errorDialog(
            "Ha ocurrido un error inesperado.\nCompruebe la conexion y vuelve a intentarlo.");
        return e.message;
      }
    }
  }
}
