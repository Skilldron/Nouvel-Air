import 'package:get/get.dart';

class StatsController extends GetxController {
  bool isEconomiesVisible = false;

  @override
  void onInit() {
    super.onInit();
  }

  void showEconomies() {
    isEconomiesVisible = !isEconomiesVisible;
    update();
  }
}
