import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nouvel_air/app/common/components/box_shadow.dart';
import 'package:nouvel_air/app/feature/home/home_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class DataIndexView extends GetView<HomeController> {
  final String title;
  final int data;
  final double width;
  final double minHeight;
  final bool center;
  final String unit;

  const DataIndexView({
    Key? key,
    required this.title,
    required this.data,
    this.width = 100,
    this.minHeight = 40,
    this.center = false,
    this.unit = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return card with 1 data and title
    return SizedBox(
      width: width,
      child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: primaryText, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: boxShadow200(),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: minHeight),
            child: Column(
              mainAxisAlignment:
                  center ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Text(
                  data.toString() + (unit.isNotEmpty ? ' $unit' : ''),
                  style: h3Style,
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      height: 1.16,
                      fontWeight: FontWeight.normal,
                      color: primaryText),
                )
              ],
            ),
          )),
    );
  }
}
