import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/common/components/card.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';
import 'package:nouvel_air/app/feature/pool/views/credit_pool_form_view.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class CreditPoolView extends StatelessWidget {
  const CreditPoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoolController>(
        init: PoolController(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: appBackground,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cagnotter",
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
                        const CardComponent(
                            title: 'Ajouter de l\'argent',
                            child: CreditPoolFormView()),
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
