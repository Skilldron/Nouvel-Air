import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';
import 'package:nouvel_air/app/feature/home/home_controller.dart';
import 'package:nouvel_air/app/feature/navigation/navigation_controller.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';
import 'package:nouvel_air/app/feature/stats/stats_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController());
    Get.put<AuthController>(AuthController());
    Get.put<PoolController>(PoolController());
    Get.put<HomeController>(HomeController());
    Get.put<StatsController>(StatsController());
  }
}
