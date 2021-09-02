import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_2/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (dynamic _) => Scaffold(
        backgroundColor: new Color.fromRGBO(155, 204, 195, 1),
        body: Center(
          child: new Image.asset('assets/images/logo1.png',
              width: 350, height: 90),
        ),
      ),
    );
  }
}
