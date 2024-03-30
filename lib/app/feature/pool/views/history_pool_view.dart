import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';

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

      return Column(
        children: [
          ...controller.history.map((item) {
            return ListTile(
              title: Text(item['amount'].toString()),
              subtitle:
                  Text(DateFormat('dd/MM/yyyy h:mm').format(item["date"])),
            );
          }).toList(),
        ],
      );
    });
  }
}
