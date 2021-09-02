import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_2/controller/register_login_controller.dart';

class RegisterLoginPage extends StatelessWidget {
  final controller = Get.put(RegisterLoginController());
  String mensaje = "Un de los campos esta vacio";
  bool validar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<RegisterLoginController>(
        init: RegisterLoginController(),
        builder: (_) {
          return Form(
            key: controller.formKey,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      // ignore: missing_return
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          print("---->" + value);

                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        child: Text('Registrar'),
                        onPressed: () async {
                           _.register();
                          print("----->${_.emailController.text}");

                          print("----->${_.emailController.text.length}");

                          if (_.emailController.text.length > 0 &&
                              _.passwordController.text.length > 0) {
                            Get.snackbar("Rellenar campos",
                                "Algunos de los campos estan vacios");
                          } else {
                            print("----->${_.emailController.text.length - 5}");
                          }
                          Get.off("/loginpage");
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(controller.success == null
                          ? ''
                          : (controller.success!
                              ? 'Successfully registered ' +
                                  controller.userEmail!
                              : 'Registration failed')),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }
}
