import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
                                        child: controller.offer["imageURI"] !=
                                                null
                                            ? Image.network(
                                                controller.offer["imageURI"],
                                                fit: BoxFit.cover,
                                              )
                                            : Container(),
                                      ),
                                      const SizedBox(height: 16),
                                      Center(
                                        child: Text(
                                          controller.offer["title"]
                                              .toUpperCase(),
                                          style: const TextStyle(
                                              color: primaryText,
                                              fontSize: 16,
                                              height: 1.2,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                            controller
                                                .offer["offerDescription"],
                                            style: const TextStyle(
                                                color: primaryText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      if (controller
                                              .offer["offerSubdescription"] !=
                                          "")
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 8.0),
                                          child: Text(
                                              controller
                                                  .offer["offerSubdescription"],
                                              style: const TextStyle(
                                                color: primaryText,
                                                fontSize: 14,
                                              )),
                                        ),
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
                                                  TextSpan(
                                                      text: controller
                                                              .isPurchasingOffer
                                                          ? 'Argent utilisé\n'
                                                          : 'Argent disponible\n'),
                                                  TextSpan(
                                                    text: currencyDigitFormat
                                                        .format(controller
                                                            .offer["price"]),
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
                                                  TextSpan(
                                                      text: controller
                                                              .isPurchasingOffer
                                                          ? 'Argent restant\n'
                                                          : 'Cagnotte minimum\n'),
                                                  TextSpan(
                                                    text: currencyDigitFormat
                                                        .format(controller
                                                            .pool.value),
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
                                      if (controller.isPurchasingOffer &&
                                          !controller.isOfferPurchased)
                                        SizedBox(
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                maximumSize: Size.infinite,
                                                backgroundColor: linkColor,
                                              ),
                                              onPressed: () =>
                                                  controller.confirmPurchase(),
                                              child: const Text(
                                                "Valider la transaction",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if (!controller.isPurchasingOffer &&
                                    !controller.isOfferPurchased) ...{
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
                                          controller.toggleIsPurchasingOffer(),
                                      child: const Text(
                                        "Utiliser ma cagnotte chez le partenaire",
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
                                } else if (controller.isOfferPurchased) ...{
                                  const SizedBox(height: 24),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Votre code de réduction :",
                                        style: TextStyle(
                                            color: primaryText,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: primaryTitle, width: 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    198, 218, 191, 0.3),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8)),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0),
                                                child: Text(
                                                    controller.offer["code"],
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: primaryTitle,
                                                      fontSize: 32,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Clipboard.setData(ClipboardData(
                                                    text: controller
                                                        .offer["code"]));
                                                Get.snackbar(
                                                  "Code copié",
                                                  "Le code a été copié dans le presse-papier",
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                  backgroundColor: primaryTitle,
                                                  colorText: Colors.white,
                                                );
                                              },
                                              child: const Column(
                                                children: [
                                                  Icon(Icons.copy, size: 16),
                                                  Text(
                                                    "copier",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                }
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
