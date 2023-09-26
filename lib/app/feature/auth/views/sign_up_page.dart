import 'package:nouvel_air/app/feature/auth/components/auth_form.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';

import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _firebaseAuth = AuthService();

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
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsetsDirectional.only(top: 34),
            child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Créer un compte', style: h1Style),
                    AuthForm(function: _firebaseAuth.createUserWithEmailAndPassword, title: 'Créer un compte'),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
