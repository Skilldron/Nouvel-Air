import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/views/login_view.dart';
import 'package:nouvel_air/app/feature/navigation/navigation_binding.dart';
import 'package:nouvel_air/app/feature/navigation/views/navigation_view.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  late final Rxn<User?> _user;

  @override
  void onReady() {
    super.onReady();

    _user = Rxn<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());

    // Update the user data when loading app.
    try {
      auth.currentUser?.reload();
    } catch (e) {
      auth.signOut();
    }

    // Listen to auth state changes
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // user is logged in
      Get.offAll(() => const NavigationView(), binding: NavigationBinding());
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => const LoginView());
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      _user.value != null
          ? Get.offAll(() => const NavigationView())
          : Get.offAll(() => const LoginView());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw FirebaseAuthException(
              code: e.code,
              message:
                  "L'adresse email semble être invalide. Vérifier qu'il contient bien un @");
        case 'user-not-found':
          throw FirebaseAuthException(
              code: e.code,
              message:
                  "Aucun utilisateur ne correspond à cette adresse email.");
        case 'wrong-password':
          throw FirebaseAuthException(
              code: e.code, message: "Le mot de passe est invalide.");
        default:
          rethrow;
      }
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> register(
      {required String email, required String password}) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw FirebaseAuthException(
              code: e.code,
              message:
                  "L'adresse email est déjà utilisée par un autre compte.");
        case 'invalid-email':
          throw FirebaseAuthException(
              code: e.code,
              message:
                  "L'adresse email semble être invalide. Vérifier qu'il contient bien un @");
        case 'weak-password':
          throw FirebaseAuthException(
              code: e.code, message: "Le mot de passe est trop faible.");
        default:
          rethrow;
      }
    }
  }
}
