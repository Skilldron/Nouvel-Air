import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AuthController _firebaseAuth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () async =>  _firebaseAuth.auth.signOut(),
      child: const Text('Sign Out'),
    )));
  }
}
