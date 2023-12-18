import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/partner_offers/partner_offers_controller.dart';


class PartnerOffersBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<PartnerOffersController>(() => PartnerOffersController());
  }
}