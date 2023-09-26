import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nouvel_air/app/models/exercice.dart';

class ExerciceService {
  final FirebaseFirestore _firebaseAuth = FirebaseFirestore.instance;


  Future<void> uploadExercice(Exercice exercice) async {
    try {
      await _firebaseAuth.collection('exercices').add(exercice.toJson());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateExercice(Exercice exercice) async {
    try {
      await _firebaseAuth
          .collection('exercices')
          .doc(exercice.id)
          .update(exercice.toJson());
    } catch (e) {
      log(e.toString());
    }
  }

    Future<List> getExercices() async {
      try {
        var exercices = await _firebaseAuth.collection('exercices').get();
        return exercices.docs
            .map((e) => ExerciceCollectionReference.fromFirestore(e, SnapshotOptions()))
            .toList();
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    }

    Future<Exercice> getExerciceById(String id) async {
      try {
        var exercice = await _firebaseAuth.collection('exercices').doc(id).get();
        return ExerciceCollectionReference.fromFirestore(exercice, SnapshotOptions());
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    }

    Future<void> deleteExerciceById(String id) async {
      try {
        await _firebaseAuth.collection('exercices').doc(id).delete();
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    }

}
