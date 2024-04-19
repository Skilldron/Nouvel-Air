import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/common/components/card.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/app/feature/partner_offers/partner_offer_detail_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';
import 'package:nouvel_air/core/utils/functions.dart';

class PartnerView extends StatelessWidget {
  const PartnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PartnerOfferDetailController>(
        init: PartnerOfferDetailController(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              decoration: appBackground,
              padding: const EdgeInsets.only(top: 16),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Offres partenaires",
                              style: h1Style,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
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
                            title: "Consulter l'offre",
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: primaryTitle,
                                          width: 1,
                                          strokeAlign: 1),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 60,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0)),
                                          ),
                                          child: controller
                                                      .offer?["imageURI"] !=
                                                  null
                                              ? Image.network(
                                                  controller.offer?["imageURI"],
                                                  fit: BoxFit.cover,
                                                )
                                              : Container(),
                                        ),
                                        const SizedBox(height: 16),
                                        Center(
                                          child: Text(
                                              controller.offer?["title"]
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  color: primaryText,
                                                  fontSize: 16,
                                                  height: 1.2,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        const SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                              controller
                                                  .offer!["offerDescription"],
                                              style: const TextStyle(
                                                  color: primaryText,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        controller.offer![
                                                    "offerSubdescription"] !=
                                                ""
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 8.0),
                                                child: Text(
                                                    controller.offer![
                                                        "offerSubdescription"],
                                                    style: const TextStyle(
                                                      color: primaryText,
                                                      fontSize: 14,
                                                    )),
                                              )
                                            : const SizedBox(),
                                        const SizedBox(height: 16),
                                        Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                    height: 1.8,
                                                    color: primaryText,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: <TextSpan>[
                                                    const TextSpan(
                                                        text:
                                                            'Argent disponible\n'),
                                                    TextSpan(
                                                      text: currencyIntFormat
                                                          .format(controller
                                                              .offer!["price"]),
                                                      style: const TextStyle(
                                                        color: primaryText,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                    height: 1.8,
                                                    color: primaryText,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: <TextSpan>[
                                                    const TextSpan(
                                                        text:
                                                            'Cagnotte minimum\n'),
                                                    TextSpan(
                                                      text: currencyIntFormat
                                                          .format(controller
                                                              .pool
                                                              .value), // TODO: change for wallet
                                                      style: const TextStyle(
                                                        color: primaryTitle,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
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
                                      child: const Text(
                                        "Cagnotter une cigarette",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
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
                                        onPressed: () =>
                                            Get.toNamed('/cagnotte'),
                                        child: const Text(
                                          "Ajouter de l'argent en cagnotte",
                                          style: TextStyle(color: linkColor),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
