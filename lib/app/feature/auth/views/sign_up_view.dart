import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';
import 'package:nouvel_air/app/feature/auth/components/auth_form.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 64,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: authBackground,
        height: Get.height,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsetsDirectional.only(top: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Créer un compte', style: h1Style),
                  AuthForm(
                      function: controller.register, title: 'Créer un compte'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
