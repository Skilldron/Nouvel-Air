import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';
import 'package:nouvel_air/app/feature/auth/components/auth_form.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/app/feature/auth/views/sign_up_view.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Container(
        decoration: authBackground,
        height: Get.height,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsetsDirectional.only(top: 64),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Me connecter', style: h1Style),
                      AuthForm(
                        function: controller.login,
                        title: 'Connexion',
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Mot de passe oublié ?",
                            style: TextStyle(
                              color: linkColor,
                              fontSize: 14,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Pas de compte ?"),
                            GestureDetector(
                                onTap: () {
                                  Get.to(const RegisterView());
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "S'inscrire",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ]),
              ),
            )),
      ),
    );
  }
}
