import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';

class AuthBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}