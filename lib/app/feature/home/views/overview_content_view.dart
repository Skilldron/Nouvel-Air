import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/home/home_controller.dart';
import 'package:nouvel_air/app/common/components/data_index_view.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class OverviewContentView extends GetView<HomeController> {
  const OverviewContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: AnimatedFlipCounter(
                        duration: const Duration(milliseconds: 1500),
                        wholeDigits: 2,
                        value: controller.isLoading.value
                            ? 00
                            : controller
                                .days.value, // pass in a value like 2014
                        textStyle: const TextStyle(
                          color: primaryText,
                          fontSize: 40,
                          fontFamily: 'Roboto Condensed',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const Text(
                    'jours',
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 40,
                      fontFamily: 'Roboto Condensed',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text("sans fumer", style: bodyBoldStyle16)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DataIndexView(
                title: "Euros économisés",
                data: controller.isLoading.value ? 130 : 130,
              ),
              DataIndexView(
                title: "Cigarettes évitées",
                data: controller.isLoading.value ? 130 : 130,
              ),
              DataIndexView(
                title: "Euros remportés",
                data: controller.isLoading.value ? 130 : 130,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    maximumSize: Size.infinite,
                    backgroundColor: linkColor,
                  ),
                  onPressed: () => controller.addCigaret(),
                  child: const Text("Cagnotter une cigarette")),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: linkColor)),
                    maximumSize: Size.infinite,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () => Get.toNamed('/cagnotte'),
                  child: const Text(
                    "Utiliser la cagnotte",
                    style: TextStyle(color: linkColor),
                  )),
            ),
          ),
        ],
      );
    });
  }
}
