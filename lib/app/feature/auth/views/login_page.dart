import 'package:flutter/material.dart';
import 'package:nouvel_air/app/feature/auth/components/auth_form.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/app/feature/auth/controller/auth_controller.dart';
import 'package:nouvel_air/app/feature/auth/views/sign_up_page.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Container(
        decoration: authBackground,
        child: Center(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsetsDirectional.only(top: 64),
                child: SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Me connecter', style: h1Style),
                        AuthForm(
                          function: _authController.login,
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterPage()));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "S'inscrire",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ]),
                ))),
      ),
    );
  }
}
