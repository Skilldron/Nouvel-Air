import 'package:nouvel_air/core/utils/colors.dart';
import 'package:flutter/material.dart';

Column styledTextField(
    {required String label,
    required String? Function(String?)? validator,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputAction textInputAction = TextInputAction.next}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: const TextStyle(
              color: primaryText, fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TextFormField(
        textInputAction: textInputAction,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Colors.black45,
        validator: validator,
        controller: controller,
        obscureText: isPassword,
        autocorrect: !isPassword,
        enableSuggestions: !isPassword,
        obscuringCharacter: '*',
        style: const TextStyle(color: primaryText, fontSize: 16),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTitle, width: 2.0),
          ),
          contentPadding: EdgeInsets.only(bottom: 16 / 2, left: 12),
          focusColor: primaryTitle,
        ),
        keyboardType:
            isPassword ? TextInputType.text : TextInputType.emailAddress,
      ),
    ],
  );
}
