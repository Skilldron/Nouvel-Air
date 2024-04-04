import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/common/components/partner_card.dart';
import 'package:nouvel_air/app/feature/home/home_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';

class PartnerContentView extends GetView<HomeController> {
  final RxList<dynamic> offers;
  // init the view with offer arguement
  const PartnerContentView({Key? key, required this.offers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 32, children: [
      if (offers.isNotEmpty)
        PartnerCard(
          heightSize: HeigthSize.small,
          title: offers[0]["title"],
          imageURI: offers[0]["imageURI"],
        ),
      ...offers.skip(1).toList().map((offer) {
        return PartnerCard(
          heightSize: HeigthSize.medium,
          title: offer["title"],
          imageURI: offer["imageURI"],
        );
      }).toList(),
      Container(
        height: 30,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () => Get.toNamed('/partner-offers'),
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            alignment: Alignment.center,
            height: 30,
            child: const Text(
              "Voir plus d'offres",
              style: TextStyle(
                color: linkColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                height: 0.20,
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
