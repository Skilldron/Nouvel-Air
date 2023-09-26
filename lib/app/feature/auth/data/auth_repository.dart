import 'package:firebase_auth/firebase_auth.dart';
import 'package:nouvel_air/app/feature/auth/service/auth_service.dart';

class AuthRepository {
  final AuthService _authcService = AuthService();

  Future<UserCredential> login(String email, String password) async {
    return await _authcService.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> register(String email, String password) async {
    return await _authcService.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logout() async {
    return await _authcService.signOut();
  }
}
