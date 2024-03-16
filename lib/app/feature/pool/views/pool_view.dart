import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/common/components/card.dart';
import 'package:nouvel_air/app/common/components/data_index_view.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';
import 'package:nouvel_air/app/feature/pool/views/history_pool_view.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class PoolView extends StatelessWidget {
  const PoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoolController>(
        init: PoolController(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              decoration: appBackground,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cagnotte",
                                style: h1Style,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          )),
                      const FractionalTranslation(
                        translation: Offset(0.11, 0),
                        child: SizedBox(
                            width: 135,
                            height: 5,
                            child: SizedBox(
                              height: 1,
                              width: 1,
                              child: ColoredBox(color: primaryTitle),
                            )),
                      ),
                      const SizedBox(height: 40),
                      CardComponent(
                        title: 'Mes économies',
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Text(
                                      '22,57',
                                      style: TextStyle(
                                        color: primaryText,
                                        fontSize: 40,
                                        fontFamily: 'Roboto Condensed',
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Text(
                                  '€',
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
                            const Text("disponibles", style: bodyBoldStyle16),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DataIndexView(
                                  title: "Euros économisés",
                                  width: 156,
                                  data: controller.isLoading.value ? 130 : 130,
                                ),
                                DataIndexView(
                                  title: "Cigarettes évitées",
                                  width: 156,
                                  data: controller.isLoading.value ? 130 : 130,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      maximumSize: Size.infinite,
                                      backgroundColor: linkColor,
                                    ),
                                    onPressed: () =>
                                        Get.toNamed('/cagnotte/add'),
                                    child:
                                        const Text("Cagnotter une cigarette")),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: const BorderSide(
                                              color: linkColor)),
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
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // History
                      const CardComponent(
                        title: 'Historique',
                        child: Column(
                          children: [HistoryPoolView()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
