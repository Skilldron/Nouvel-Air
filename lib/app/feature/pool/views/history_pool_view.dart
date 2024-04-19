import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/functions.dart';

class HistoryPoolView extends StatelessWidget {
  const HistoryPoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoolController>(builder: (controller) {
      // If there is no history, display a message
      if (controller.history.isEmpty) {
        return const Center(
          child: Text("Aucun historique"),
        );
      }

      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            ...controller.history.map((item) {
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('dd.MM.yy').format(item["date"]),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryText)),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: DottedLine(
                            dashLength: 3,
                            dashGapLength: 4,
                            lineThickness: 3,
                            dashRadius: 16,
                          ),
                        ),
                      ),
                      Text(
                        "${item['type']}${currencyDigitFormat.format(item['amount'])}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                item['type'] == "+" ? primaryTitle : linkColor),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      );
    });
  }
}
