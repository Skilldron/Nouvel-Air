import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

void logError(
    {required String message, required Exception error, int level = 0}) {
  if (error is FirebaseAuthException) {
    log(
      message,
      error: error,
      stackTrace: error.stackTrace,
      name: error.code,
      time: DateTime.now(),
      level: level,
    );
    return;
  }

  log(
    message,
    error: error,
    name: "Error",
    time: DateTime.now(),
    level: level,
  );
}
