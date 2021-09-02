import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:inventario_2/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  bool _ispassword = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        //appBar: AppBar(),
        body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (_) {
            return SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                        ),
                        Container(
                          width: 400,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFDBD5C8),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: new Image.asset(
                                  'assets/images/logo1.png',
                                ),
                              ),
                              Container(
                                child: const Text(
                                  'BIENVENIDO',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              TextFormField(
                                controller: controller.emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  suffixText: "Introduce tu correo electronico",
                                  suffixIcon: Icon(
                                    Icons.alternate_email,
                                    color: Color(0xff245c4c),
                                  ),
                                  border: UnderlineInputBorder(),
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty)
                                    return 'Please enter some text';
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: controller.passwordController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Password',
                                    suffixText: "Introduce tu contrasenna",
                                    suffixIcon: Icon(
                                      Icons.visibility_off,
                                      color: Color(0xff245c4c),
                                    )),
                                validator: (String? value) {
                                  if (value!.isEmpty)
                                    return 'Please enter some text or numbers';
                                  return null;
                                },
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 16.0),
                                alignment: Alignment.center,
                                child: SignInButton(
                                  Buttons.Email,
                                  text: "Ingresar",
                                  onPressed: () async {
                                    _.signInWithEmailAndPassword();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        /*  Container(
                              padding: const EdgeInsets.only(top: 16.0),
                              alignment: Alignment.center,
                              child: SignInButton(
                                Buttons.GoogleDark,
                                text: "Google",
                                onPressed: () async {
                                  _.signInWithGoogle();
                                },
                              ),
                            ),
                            Container(
                              child: SignInButtonBuilder(
                                icon: Icons.person_add,
                                backgroundColor: Colors.blueAccent,
                                text: 'Registration',
                                onPressed: () => Get.toNamed("/registration"),
                              ),
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.center,
                            ),*/
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
