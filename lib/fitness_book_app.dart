import 'package:nouvel_air/app/feature/auth/service/auth_service.dart';
import 'package:flutter/material.dart';

import 'app/common/nav_bar.dart';
import 'app/feature/auth/views/login_page.dart';

class FitnessBookApp extends StatefulWidget {
  const FitnessBookApp({super.key});

  @override
  State<FitnessBookApp> createState() => _FitnessBookAppState();
}

class _FitnessBookAppState extends State<FitnessBookApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavBar();
          } else {
            return const LoginPage();
          }
        },
        stream: AuthService().authStateChanges);
  }
}
