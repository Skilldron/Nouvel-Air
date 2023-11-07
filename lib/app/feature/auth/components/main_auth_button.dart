import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';
import 'package:flutter/material.dart';

Padding mainAuthButton(bool isLoading, function, String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 64),
    child: Center(
        child: ConstrainedBox(
      constraints:
          const BoxConstraints(minWidth: double.infinity, minHeight: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          maximumSize: Size.infinite,
          backgroundColor: primaryTitle,
        ),
        onPressed: isLoading ? null : function,
        child: isLoading
            ? Container(
                padding: const EdgeInsets.all(2.0),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Text(
                title,
                style: bodyBoldStyle14,
              ),
      ),
    )),
  );
}
