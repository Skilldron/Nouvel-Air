import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/common/components/card.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/app/feature/stats/components/trophee_card.dart';
import 'package:nouvel_air/app/feature/stats/stats_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class DetailsStatsView extends StatelessWidget {
  const DetailsStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: StatsController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: appBackground,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: primaryTitle,
                      onPressed: () => Get.back(),
                    )),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mes trophées",
                            style: h1Style,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const FractionalTranslation(
                      translation: Offset(0.11, 0),
                      child: SizedBox(
                          width: 126,
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
                        title: 'Trophées emportés',
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: [
                                          if (controller.tropheesEarned.isEmpty)
                                            const Text(
                                              "Aucun trophée emporté",
                                              style: TextStyle(
                                                  color: primaryText,
                                                  fontSize: 16),
                                            )
                                          else
                                            ...(controller.tropheesEarned
                                                .map(
                                                  (trophy) => GestureDetector(
                                                    onTap: () => showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                content:
                                                                    Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              18.0),
                                                                  child:
                                                                      ConstrainedBox(
                                                                    constraints:
                                                                        const BoxConstraints(
                                                                            maxHeight:
                                                                                250),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          trophy[
                                                                              'iconURI'],
                                                                          height:
                                                                              100,
                                                                          width:
                                                                              100,
                                                                        ),
                                                                        Wrap(
                                                                          alignment:
                                                                              WrapAlignment.center,
                                                                          runSpacing:
                                                                              8,
                                                                          spacing:
                                                                              8,
                                                                          children: [
                                                                            Text(trophy['title'],
                                                                                style: const TextStyle(color: primaryText, fontSize: 16, fontWeight: FontWeight.bold)),
                                                                            Text(
                                                                              trophy['description'],
                                                                              style: const TextStyle(color: primaryText, fontSize: 16),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ))),
                                                    child: TropheeCardView(
                                                        title: trophy['title'],
                                                        isEarned: true,
                                                        imageURI:
                                                            trophy['iconURI']),
                                                  ),
                                                )
                                                .toList()),
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
                    const SizedBox(height: 40),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CardComponent(
                        title: 'Trophées à valider',
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: double.infinity,
                                      child: Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: [
                                          TropheeCardView(
                                            title: "Trophée mystère 1",
                                            imageURI:
                                                'assets/images/trophee_not_acquired.png',
                                          ),
                                          TropheeCardView(
                                            title: "Trophée mystère 2",
                                            imageURI:
                                                'assets/images/trophee_not_acquired.png',
                                          ),
                                          TropheeCardView(
                                            title: "Trophée mystère 3",
                                            imageURI:
                                                'assets/images/trophee_not_acquired.png',
                                          ),
                                          TropheeCardView(
                                            title: "Trophée mystère 4",
                                            imageURI:
                                                'assets/images/trophee_not_acquired.png',
                                          ),
                                          TropheeCardView(
                                            title: "Trophée mystère 5",
                                            imageURI:
                                                'assets/images/trophee_not_acquired.png',
                                          ),
                                          TropheeCardView(
                                            title: "Trophée mystère 6",
                                            imageURI:
                                                'assets/images/trophee_not_acquired.png',
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
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
