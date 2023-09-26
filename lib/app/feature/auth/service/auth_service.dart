import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser!;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch(e.code) {
        case 'invalid-email':
          throw FirebaseAuthException(code: e.code, message: "L'adresse email semble être invalide. Vérifier qu'il contient bien un @");
        case 'user-not-found':
          throw FirebaseAuthException(code: e.code, message: "Aucun utilisateur ne correspond à cette adresse email.");
        case 'wrong-password':
          throw FirebaseAuthException(code: e.code, message: "Le mot de passe est invalide.");
        default:
          rethrow;
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log('Error during sign out', error: e);
      rethrow;
    }
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch(e.code) {
        case 'email-already-in-use':
          throw FirebaseAuthException(code: e.code, message: "L'adresse email est déjà utilisée par un autre compte.");
        case 'invalid-email':
          throw FirebaseAuthException(code: e.code, message: "L'adresse email semble être invalide. Vérifier qu'il contient bien un @");
        case 'weak-password':
          throw FirebaseAuthException(code: e.code, message: "Le mot de passe est trop faible.");
        default:
          rethrow;
      }
    }
  }
}
