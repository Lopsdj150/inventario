import 'package:get/instance_manager.dart';

class AuthExceptionHandler {
  String? errorMensaje(String error) {
    print(error + "----");
    String? mensaje;

    switch ('ERROR-' + error) {
      case "ERROR-INVALID-EMAIL":
        mensaje = "Formato de correo invalido ";
        break;
      case "ERROR-WRONG-PASSWORD":
        mensaje = 'Tu contraseña es incorrecta';

        break;

      case "ERROR-USER-NOT-FOUND":
        mensaje = 'Correo no encontrado, porfavor hable con el administrador';
        break;
      case "ERROR-USER-DISABLED":
        mensaje = 'Este correo esta desactivado';

        break;

      case "ERROR-TOO-MANY-REQUESTS":
        mensaje = 'Demasiadas solicitudes. Inténtelo de nuevo más tarde.';
        break;

      case "ERROR-EMAIL-ALREADY-IN-USE":
        mensaje = 'El correo electrónico ya fue usado, ';
        break;

      case "ERROR-WEAK-PASSWORD":
        mensaje = 'Password debe ser mas 8 caracateres ';
        break;

      case "ERROR-CAMPOS-VACIOS":
        mensaje = 'Algunos campos estan vacios';
        break;

      default:
        mensaje = '';
    }
    return mensaje;
  }
}
