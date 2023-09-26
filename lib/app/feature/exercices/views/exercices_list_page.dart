import 'package:nouvel_air/app/feature/exercices/controller/exercice_controller.dart';
import 'package:nouvel_air/app/models/exercice.dart';
import 'package:nouvel_air/core/types/exercise_difficulty.dart';
import 'package:flutter/material.dart';

class ExercicesListPage extends StatefulWidget {
  const ExercicesListPage({super.key});

  @override
  State<ExercicesListPage> createState() => _ExercicesListPageState();
}

class _ExercicesListPageState extends State<ExercicesListPage> {
  final ExericeController _exerciceController = ExericeController();
  final ExerciceCategoryCollectionReference _exerciceCategoryCollectionReference = ExerciceCategoryCollectionReference();

  Future<void> _uploadExercice() async {
    await _exerciceController.uploadExercice(
      name: "curl",
      muscleTarget: "biceps court",
      urlGif: "urlGif",
      urlImage: "urlImage",
      urlVideo: "urlVideo",
      instruction: "instruction",
      difficulty: Difficulty.easy,
      documentId: "bras"
    );
  }

  Future<ExerciceCategoryQuerySnapshot> _getAllExercies() async {
   var exercices = await _exerciceCategoryCollectionReference.get();

    return exercices;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercices'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Upload exercice'),
              onPressed: () async => await _uploadExercice(),
            ),
          ),
        ],
      ),
    );
  }
}