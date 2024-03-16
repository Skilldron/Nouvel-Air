import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/partner_offers/partner_offers_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PartnerOffersController>(
        init: PartnerOffersController(),
        builder: (controller) {
          return SizedBox(
            height: 100,
            width: double.infinity,
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.offers.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                          ),
                          child: Image.network(
                            "https://picsum.photos/1800/300",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("DECATHLON",
                              style: TextStyle(
                                  color: primaryText,
                                  fontSize: 16,
                                  height: 1.2,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          width: 300,
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Frais de livraison offerts",
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                              Container(
                                  color: linkColor,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.5, vertical: 8.0),
                                    child: Text("Voir l'offre",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Roboto",
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
