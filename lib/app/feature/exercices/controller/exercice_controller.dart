import 'package:nouvel_air/app/feature/exercices/data/exercice_repository.dart';
import 'package:nouvel_air/app/models/exercice.dart';
import 'package:nouvel_air/core/types/exercise_difficulty.dart';
import 'package:nouvel_air/core/utils/uuid.dart';

class ExericeController {
  final ExerciceRepository _exerciceRepository = ExerciceRepository();

  Future<void> uploadExercice(
      {required String name,
      required String muscleTarget,
      required String urlGif,
      required String urlImage,
      required String urlVideo,
      required String instruction,
      required Difficulty difficulty, String? documentId}) async {
    Exercice exercice = Exercice(
      id: documentId ?? UUID.getUUID(),
      name: name,
      muscleTarget: muscleTarget,
      urlGif: urlGif,
      urlImage: urlImage,
      urlVideo: urlVideo,
      instruction: instruction,
      difficulty: difficulty,
    );
    
    await _exerciceRepository.uploadExercice(exercice);
  }

  Future<void> updateExercice(Exercice exercice) async {
    await _exerciceRepository.updateExercice(exercice);
  }

  Future<List> getAllExercices() async {
    return await _exerciceRepository.getExercices();
  }

  Future<Exercice> getExerciceById(String id) async {
    return await _exerciceRepository.getExerciceById(id);
  }

  Future<void> deleteExerciceById(String id) async {
    await _exerciceRepository.deleteExerciceById(id);
  }
}
