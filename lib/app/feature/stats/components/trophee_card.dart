import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nouvel_air/app/common/components/box_shadow.dart';
import 'package:nouvel_air/app/feature/home/home_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';

class TropheeCardView extends GetView<HomeController> {
  final String title;
  final String imageURI;
  final double width;
  final double minHeight;
  final bool isEarned;

  const TropheeCardView({
    Key? key,
    required this.title,
    required this.imageURI,
    this.width = 100,
    this.minHeight = 40,
    this.isEarned = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return card with 1 data and title
    return SizedBox(
      width: width,
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: primaryText, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: boxShadow200(),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: minHeight),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: isEarned
                      ? Image.network(
                          imageURI,
                          width: 55,
                          height: 55,
                        )
                      : Image.asset(
                          imageURI,
                          width: 55,
                          height: 55,
                        ),
                ),
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
