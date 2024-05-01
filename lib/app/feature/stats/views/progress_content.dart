import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/stats/components/stat_tag.dart';
import 'package:nouvel_air/app/feature/stats/stats_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';

class ProgressContent extends StatelessWidget {
  const ProgressContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(
        init: StatsController(),
        builder: (controller) {
          return Wrap(
            runSpacing: 24,
            children: [
              const Wrap(
                runSpacing: 12,
                children: [
                  Text("Santé",
                      style: TextStyle(
                          fontSize: 20,
                          color: linkColor,
                          fontWeight: FontWeight.bold)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 12,
                      children: [
                        StatTag(title: "Respiration"),
                        StatTag(title: "Sommeil"),
                        StatTag(title: "5 sens"),
                        StatTag(title: "Cardio"),
                        StatTag(title: "cigarettes évitées"),
                      ],
                    ),
                  ),
                ],
              ),
              Wrap(runSpacing: 12, children: [
                const Text("Finances",
                    style: TextStyle(
                        fontSize: 20,
                        color: linkColor,
                        fontWeight: FontWeight.bold)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 12,
                    children: [
                      StatTag(title: "Consommation"),
                      StatTag(title: "Cash back"),
                      GestureDetector(
                          onTap: () => controller.showEconomies(),
                          child: StatTag(
                              title: "Économies",
                              isSelected: controller.isEconomiesVisible)),
                    ],
                  ),
                ),
                if (controller.isEconomiesVisible)
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/stats.png',
                      width: double.infinity,
                      height: 394,
                    ),
                  )
              ]),
            ],
          );
        });
  }
}
