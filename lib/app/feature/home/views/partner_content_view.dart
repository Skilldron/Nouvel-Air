import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/common/components/partner_card.dart';
import 'package:nouvel_air/app/feature/home/home_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';

class PartnerContentView extends GetView<HomeController> {
  const PartnerContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 32, children: [
      const PartnerCard(
          heightSize: HeigthSize.small,
          title: 'Decathlon',
          imageURI: "https://picsum.photos/1800/300"),
      const PartnerCard(
          heightSize: HeigthSize.medium,
          title: 'Decathlon',
          imageURI: "https://picsum.photos/1800/300"),
      const PartnerCard(
          heightSize: HeigthSize.medium,
          title: 'Decathlon',
          imageURI: "https://picsum.photos/1800/300"),
      Container(
        height: 30,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () => Get.toNamed('/cagnotte'),
          child: Container(
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
