import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';

class HistoryPoolView extends StatelessWidget {
  const HistoryPoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoolController>(builder: (controller) {
      return Column(
        children: [
          // For each history item, display the amount and the date
          for (var item in controller.history)
            ListTile(
              title: Text(item['amount'].toString()),
              subtitle:
                  Text(DateFormat('dd/MM/yyyy h:mm').format(item['date'])),
            ),
        ],
      );
    });
  }
}
