import 'dart:convert';

import 'package:parceragem/app/domain/entities/task_entity.dart';
import 'package:parceragem/app/infra/models/profession_model.dart';

class TaskModel {
  final String uuid;
  final String name;
  final ProfessionModel profession;

  TaskModel({
    required this.uuid,
    required this.name,
    required this.profession,
  });

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'profession': profession,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      uuid: map['uuid'] ?? '',
      name: map['name'] ?? '',
      profession: map['profession'] ?? '',
    );
  }

  TaskEntity toEntity() => TaskEntity(
        uuid: uuid,
        name: name,
        profession: profession.toEntity(),
      );

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      uuid: entity.uuid,
      name: entity.name,
      profession: ProfessionModel.fromEntity(entity.profession),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));
}
