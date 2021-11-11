import 'dart:convert';

import '../../domain/entities/task_entity.dart';
import 'profession_model.dart';

class TaskModel {
  final String id;
  final String name;
  final ProfessionModel profession;

  TaskModel({
    required this.id,
    required this.name,
    required this.profession,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profession': profession,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      profession: map['profession'] ?? '',
    );
  }

  TaskEntity toEntity() => TaskEntity(
        id: id,
        name: name,
        profession: profession.toEntity(),
      );

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      name: entity.name,
      profession: ProfessionModel.fromEntity(entity.profession),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));
}
