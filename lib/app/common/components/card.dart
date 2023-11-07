import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final Widget child;
  final double minHeight;

  const CardComponent({
    Key? key,
    required this.title,
    this.minHeight = 200,
    required this.child
  }) : super(key: key);

  Widget buildBlur({
    required Widget child,
    BorderRadius? borderRadius,
    double sigmaX = 2,
    double sigmaY = 2,
  }) =>
      ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: child));

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              constraints: const BoxConstraints(
                  minWidth: double.infinity),
              child: const Text('', style: h2Style),
            ),
            buildBlur(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: Container(
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(
                    minWidth: double.infinity),
                child: Text(title, style: h2Style),
              ),
            )
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
          constraints: BoxConstraints(
                  minWidth: double.infinity, minHeight: minHeight),
          child: child
        ),
      ],
    );
  }
}
