import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/stats/stats_controller.dart';

class StatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatsController>(() => StatsController());
  }
}
