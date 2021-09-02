import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterLoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool? success;
  String? userEmail;
// Example code of how to sign in with email and password.

  void register() async {
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ))
          .user;
      if (user != null) {
        success = true;
        Get.snackbar("Registro exitoso", "");
        Future.delayed(
          Duration(seconds: 2),
          () {
            Get.off(
              "/loginpage",
            );
          },
        );
        userEmail = user.email;
      } else {
        success = false;
      }
    } on FirebaseAuthException catch (e) {
      //Get.snackbar("Registro no exitoso", "Este correo ya esta registrado");
      String error = 'ERROR';
      String mensaje = '';
      print('error' + e.code.toUpperCase());

      switch ('ERROR-' + e.code.toUpperCase()) {
        case "ERROR-INVALID-EMAIL":
          mensaje = "Correo invalido ";
          break;
        case "ERROR-WRONG-PASSWORD":
          mensaje = 'Tu contraseña es incorrecta';

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
      }
      Get.snackbar(error, mensaje);
    }
  }
}
