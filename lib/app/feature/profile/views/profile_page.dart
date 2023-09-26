import 'package:flutter/material.dart';

import '../../auth/service/auth_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthService _firebaseAuth = AuthService();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () async => await signOut(),
      child: const Text('Sign Out'),
    )));
  }
}
