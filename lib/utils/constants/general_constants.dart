import 'package:logger/logger.dart';

class GeneralConstants {
  static String email_not_found = "Email incorrecto. No está asociado a ningun correo guardado.\nIntentelo de nuevo";

  static String wrong_password = "Contraseña incorrecta.\nIntentelo de nuevo";

  static String user_disabled = "Cuenta deshabilitada por el administrador.";

  static String generic_error = "Ha ocurrido un error inesperado.\nCompruebe la conexion y vuelve a intentarlo.";

  static String no_internet_connection = "No tienes conexión a internet.\nVuelve a intentarlo más tarde.";

  static String empty_value = "No se ha introducido ningun valor.\nVuelve a intentarlo.";

  static String email_wrong = "Correo introducido no valido.\nVuelve a intentarlo.";

  static String password_wrong = "Contraseña no valida, supera la longitud permitida.\nVuelve a intentarlo.";

  static const String titleAdvertenciaDialogInfo = "!!!ADVERTENCIA!!!";

  static const String titleDialogInfo = "INFO";

  static const String titleDialogError = "ERROR";

  static const String labelButtonDialogInfo = "Aceptar";

  static const String labelConfirmarDialogo = "Confirmar";

  static const String labelCancelarDialogo = "Cancelar";

  static const String labelCerrarDialogo = "Cerrar";

  static const String labelConfirmDeleteDataBD =
      "Estas seguro de borrar los datos.\n Si continuas se eliminará la informacion de forma permanente.\n¿Deseas continuar?";

  static Logger logger = Logger();
}
