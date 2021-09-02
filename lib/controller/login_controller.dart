import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inventario_2/Exception/AuthException.dart';
import 'package:inventario_2/pages/login_page.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AuthExceptionHandler? _mensajeError;
// Iniciar sesion con email y contraseña

  // ignore: unused_element
  void signInWithEmailAndPassword() async {
    try {
      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty) {
        final User user = (await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ))
            .user!;
        Get.snackbar('Hola ${user.displayName}', 'Su ingreso ha sido exitoso');
        print('Ingreso bien');

        Future.delayed(Duration(seconds: 2), () {
          Get.offNamed("/foodpage");
        });
      } else {
        Get.snackbar(
            'Error', new AuthExceptionHandler().errorMensaje("CAMPOS-VACIOS")!);
      }
    } on FirebaseAuthException catch (e) {
      print('error' + e.code.toUpperCase());
      Get.offNamed("/loginpage");

      Get.snackbar('Error',
          new AuthExceptionHandler().errorMensaje(e.code.toUpperCase())!);
      //  Get.snackbar('Hol|a', 'No ha podido ingresar',
      //   snackPosition: SnackPosition.BOTTOM);

    }
  }

//Cerrar sesion
  void _signOut() async {
    await _auth.signOut();
    Get.snackbar('Adios', 'Cuidese mucho');
    exit(0);
  }

//Bienvenida
  void signOut() async {
    final User? user = await _auth.currentUser;
    if (user == null) {
      Get.snackbar('Out', 'No one has signed in.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    _signOut();
    final String uid = user.uid;
    Get.snackbar('Out', uid + ' has successfully signed out.',
        snackPosition: SnackPosition.BOTTOM);
    Get.snackbar('Adios', 'Cuidese mucho');
    _auth.signOut();

    exit(0);
  }

//Inicio de sesion Google
  void signInWithGoogle() async {
    try {
      UserCredential userCredential;

      final GoogleSignInAccount googleUser =
          await (GoogleSignIn().signIn() as Future<GoogleSignInAccount>);
      print("------>>>> ${googleUser.email.toString()}");

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;
      userCredential = await _auth.signInWithCredential(googleAuthCredential);
      print("------>>>> ${userCredential.user}");
      print("------>>>> ${googleUser.email}");
      // _auth.signOut();

      final user = userCredential.user!;
      Get.snackbar('Hola', 'Sign In ${user.displayName} with Google');
      print('Ingreso bien');
      Future.delayed(
        Duration(seconds: 2),
        () {
          Get.offNamed("/loginpage");
        },
      );
    } catch (e) {
      print(e);
      e.printError();
      print(e);
      Get.offNamed('/loginpage');
      Get.snackbar('Fallo', 'Porfavor inicie sesion',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //Mensaje de errores

}
