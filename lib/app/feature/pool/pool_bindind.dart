import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';

class PoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PoolController>(PoolController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
