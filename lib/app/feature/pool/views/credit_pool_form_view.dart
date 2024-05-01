import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';

class CreditPoolFormView extends StatelessWidget {
  const CreditPoolFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final amountController = TextEditingController();
    final cigaretteAmountController = TextEditingController();

    return GetBuilder<PoolController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Quel montant?",
              style: TextStyle(
                color: linkColor,
                fontSize: 20,
                height: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryTitle, width: 2.0),
                  ),
                  contentPadding: EdgeInsets.only(bottom: 16 / 2, left: 12),
                  focusColor: primaryTitle,
                  suffixIcon: Icon(
                    Icons.euro,
                    color: primaryText,
                  )),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: controller.addQuantityByCigarette,
                  onChanged: (bool? value) {
                    controller.addQuantityByCigarette = value!;
                    controller.update();
                  },
                  activeColor: primaryTitle,
                ),
                const Text("Ajouter le montant d'une cigarette",
                    style: TextStyle(color: primaryText)),
              ],
            ),
            if (controller.addQuantityByCigarette)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Nombre de cigarette à cagnotter :",
                      style: TextStyle(
                        color: primaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12)),
                            border: Border(
                                top: BorderSide(color: linkColor),
                                bottom: BorderSide(color: linkColor),
                                left: BorderSide(color: linkColor)),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12))),
                              maximumSize: Size.infinite,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: controller.nbCigarret == 0
                                ? null
                                : () {
                                    controller.nbCigarret--;
                                    double result =
                                        controller.calculateAmount();
                                    amountController.text = result.toString();
                                    controller.update();
                                  },
                            child: const Text("-"),
                          ),
                        ),
                        FormField(builder: (FormFieldState state) {
                          return Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                border: Border(
                              bottom: BorderSide(color: primaryTitle),
                              top: BorderSide(color: primaryTitle),
                              left: BorderSide(color: primaryTitle),
                              right: BorderSide(color: primaryTitle),
                            )),
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              controller: cigaretteAmountController
                                ..text = controller.nbCigarret.toString(),
                              onChanged: (value) {
                                controller.nbCigarret = int.parse(value);
                                controller.update();
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          );
                        }),
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            border: Border(
                                top: BorderSide(color: linkColor),
                                bottom: BorderSide(color: linkColor),
                                right: BorderSide(color: linkColor)),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              maximumSize: Size.infinite,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              controller.nbCigarret++;
                              double result = controller.calculateAmount();
                              amountController.text = result.toString();
                              controller.update();
                            },
                            child: const Text("+"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 48),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      maximumSize: Size.infinite,
                      backgroundColor: linkColor,
                    ),
                    onPressed: () async {
                      var value = amountController.text.replaceAll(',', '.');
                      await controller.credit(double.parse(value));
                      Get.back();
                    },
                    child: const Text("Cagnotter",
                        style: TextStyle(color: Colors.white))),
              ),
            ),
          ],
        ),
      );
    });
  }
}
