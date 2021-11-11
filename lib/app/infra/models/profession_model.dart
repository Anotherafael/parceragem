import 'dart:convert';

import '../../domain/entities/profession_entity.dart';
import 'section_model.dart';

class ProfessionModel {
  final String id;
  final String name;
  final SectionModel section;

  ProfessionModel({
    required this.id,
    required this.name,
    required this.section,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'section': section,
    };
  }

  factory ProfessionModel.fromMap(Map<String, dynamic> map) {
    return ProfessionModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      section: SectionModel.fromMap(map['section']),
    );
  }

  ProfessionEntity toEntity() => ProfessionEntity(
        id: id,
        name: name,
        section: section.toEntity(),
      );

  factory ProfessionModel.fromEntity(ProfessionEntity entity) {
    return ProfessionModel(
      id: entity.id,
      name: entity.name,
      section: SectionModel.fromEntity(entity.section),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionModel.fromJson(String source) =>
      ProfessionModel.fromMap(json.decode(source));
}
