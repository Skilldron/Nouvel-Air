import 'package:nouvel_air/app/feature/exercices/service/exercice_service.dart';
import 'package:nouvel_air/app/models/exercice.dart';


class ExerciceRepository {
  final ExerciceService _exerciceService = ExerciceService();

  Future<void> uploadExercice(Exercice exercice) async {
    await _exerciceService.uploadExercice(exercice);
  }

  Future<void> updateExercice(Exercice exercice) async {
    await _exerciceService.updateExercice(exercice);
  }

  Future<List> getExercices() async {
    return await _exerciceService.getExercices();
  }

  Future<Exercice> getExerciceById(String id) async {
    return await _exerciceService.getExerciceById(id);
  }

  Future<void> deleteExerciceById(String id) async {
    await _exerciceService.deleteExerciceById(id);
  }
  
}
