import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_2/controller/login_controller.dart';

class FoodPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Network'),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return
                // TextButton(
                //   onPressed: () async {
                //     controller.signOut();
                //   },
                //   child: const Text('Sign out',style: TextStyle(color: Theme.of(context).buttonColor),),

                // );

                FlatButton(
              child: const Text('Sign out'),
              textColor: Theme.of(context).buttonColor,
              onPressed: () async {
                controller.signOut();
              },
            );
          })
        ],
      ),
      body: Center(
        child: Text('Food page',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black)),
      ),
    );
  }
}
