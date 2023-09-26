import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nouvel_air/core/types/exercise_difficulty.dart';
import 'package:nouvel_air/core/types/exercise_target.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'exercice.g.dart';

@JsonSerializable(explicitToJson: true, converters: firestoreJsonConverters, createFieldMap: true)
class ExerciceCategory {
  ExerciceCategory({
    required this.name,
    this.urlImage,
  });

  factory ExerciceCategory.fromJson(Map<String, Object?> json) => _$ExerciceCategoryFromJson(json);

  Map<String, Object?> toJson() => _$ExerciceCategoryToJson(this);

  @Id()
  final ExerciseTarget name;
  final String? urlImage;

}

@JsonSerializable(explicitToJson: true, createFieldMap: true)
class Exercice {
  Exercice({
    required this.id,
    required this.name,
    required this.instruction,
    required this.muscleTarget,
    required this.difficulty,
    this.urlGif,
    this.urlImage,
    this.urlVideo,
  });

  factory Exercice.fromJson(Map<String, Object?> json) => _$ExerciceFromJson(json);
  Map<String, Object?> toJson() => _$ExerciceToJson(this);


  @Id()
  final String id;
  final String name;
  final String instruction;
  final String muscleTarget;
  final Difficulty difficulty;
  final String? urlGif;
  final String? urlImage;
  final String? urlVideo;

}


@Collection<ExerciceCategory>('exercice_categories')
@Collection<Exercice>('exercice_categories/*/exercices', name: 'exercices')
final exerciceCategoryRef = ExerciceCategoryCollectionReference();