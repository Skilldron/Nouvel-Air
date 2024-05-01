import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/common/components/card.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/app/common/components/data_index_view.dart';
import 'package:nouvel_air/app/feature/stats/components/trophee_card.dart';
import 'package:nouvel_air/app/feature/stats/stats_controller.dart';
import 'package:nouvel_air/app/feature/stats/views/progress_content.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class StatsView extends StatelessWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(
        init: StatsController(),
        builder: (controller) {
          return Scaffold(
              body: Container(
                  decoration: appBackground,
                  padding: const EdgeInsets.only(top: 16),
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
                                  "Mes stats",
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
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CardComponent(
                              title: 'Mes objectifs',
                              minHeight: 70,
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Column(
                                    children: [
                                      const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DataIndexView(
                                            width: 156,
                                            minHeight: 70,
                                            center: true,
                                            title: "cigarette/jour",
                                            data: 0,
                                          ),
                                          SizedBox(width: 16),
                                          DataIndexView(
                                            width: 156,
                                            unit: '€',
                                            minHeight: 70,
                                            center: true,
                                            title: "économisés/\nsemaine",
                                            data: 150,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: GestureDetector(
                                            onTap: () => debugPrint("je tape"),
                                            child: const Text(
                                              "Modifier mes objectifs",
                                              style: TextStyle(
                                                color: linkColor,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 16,
                                              ),
                                            )),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ))),
                        )),
                        const SizedBox(height: 40),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CardComponent(
                            title: 'Trophées',
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 8),
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: double.infinity,
                                          child: Wrap(
                                            spacing: 8,
                                            runSpacing: 8,
                                            children: [
                                              TropheeCardView(
                                                title: "Investisseur",
                                                imageURI:
                                                    'assets/images/trophe1.png',
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: GestureDetector(
                                              onTap: () =>
                                                  Get.toNamed('/stats/details'),
                                              child: const Text(
                                                "Voir plus",
                                                style: TextStyle(
                                                  color: linkColor,
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 16,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ))),
                          ),
                        )),
                        const SizedBox(height: 48),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CardComponent(
                              title: 'Progression',
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8),
                                  child: const ProgressContent())),
                        )),
                        const SizedBox(height: 48),
                      ])))));
        });
  }
}
