import 'package:get/get.dart';
import 'package:inventario_2/pages/food_page.dart.dart';
import 'package:inventario_2/pages/home_page.dart';
import 'package:inventario_2/pages/login_page.dart';
import 'package:inventario_2/pages/register_login_page.dart';
import 'package:inventario_2/pages/splash_page.dart';

routes() => [
      GetPage(name: "/splash", page: () => SplashPage()),
      //  GetPage(name: "/home", page: () => HomePage()),
      GetPage(name: "/registration", page: () => RegisterLoginPage()),
      GetPage(name: "/loginpage", page: () => LoginPage()),
      GetPage(name: "/logingoogle", page: () => LoginPage()),
      GetPage(
          name: "/foodpage",
          page: () => FoodPage(),
          transition: Transition.zoom)
    ];
