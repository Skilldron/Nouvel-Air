import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';
import 'package:nouvel_air/app/nouvel_air.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await initializeDefault();
  } on FirebaseException catch (e) {
    debugPrint('Error during firebase initialization: $e');
  }

  runApp(const MyApp());
}

Future<void> initializeDefault() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));

  // Étant donné que kDebugMode est une valeur constante, le compilateur Dart sait qu'il doit supprimer complètement ce bloc de code en mode de publication.
  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => const NouvelAir();
}
