import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'fitness_book_app.dart';

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
  );

  // Étant donné que kDebugMode est une valeur constante, le compilateur Dart sait qu'il doit supprimer complètement ce bloc de code en mode de publication.
  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Persistent Bottom Navigation Bar example project",
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: primary,
          secondaryHeaderColor:primaryTitle,
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        home: const FitnessBookApp(),
      );
}
