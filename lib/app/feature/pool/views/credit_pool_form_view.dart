import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';

class CreditPoolFormView extends StatelessWidget {
  const CreditPoolFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final amountController = TextEditingController();

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
              // autofocus: true,
              controller: amountController,
              keyboardType: TextInputType.number,
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
                    onPressed: () =>
                        controller.credit(int.parse(amountController.text)),
                    child: const Text("Cagnotter")),
              ),
            ),
          ],
        ),
      );
    });
  }
}
