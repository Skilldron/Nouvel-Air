import 'package:flutter/material.dart';
import 'package:nouvel_air/core/utils/colors.dart';

class StatTag extends StatelessWidget {
  final String title;
  final bool isSelected;

  const StatTag({super.key, required this.title, bool this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: primaryText),
              color: isSelected ? primaryTitle : Colors.transparent,
            ),
            child: Text(title,
                style: TextStyle(
                    color: isSelected ? Colors.white : primaryText,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal))),
      ],
    );
  }
}
