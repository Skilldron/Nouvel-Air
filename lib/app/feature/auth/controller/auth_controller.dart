import '../data/auth_repository.dart';

class AuthController {
  final AuthRepository _authRepository = AuthRepository();

  Future<void> login({required String email, required String password}) async {
    await _authRepository.login(email, password);
  }

  Future<void> register(
      {required String email, required String password}) async {
    await _authRepository.register(email, password);
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }
}
