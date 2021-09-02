import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:inventario_2/pages/home_page.dart';
import 'package:inventario_2/pages/login_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    Future.delayed(Duration(seconds: 2), () {
      Get.off(LoginPage(),
          transition: Transition.zoom, duration: Duration(seconds: 2));
    });
  }
}
