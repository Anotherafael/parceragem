import 'dart:convert';

import 'package:parceragem/app/domain/entities/profession_entity.dart';
import 'package:parceragem/app/infra/models/section_model.dart';

class ProfessionModel {
  final String uuid;
  final String name;
  final SectionModel section;

  ProfessionModel({
    required this.uuid,
    required this.name,
    required this.section,
  });

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'section': section,
    };
  }

  factory ProfessionModel.fromMap(Map<String, dynamic> map) {
    return ProfessionModel(
      uuid: map['uuid'] ?? '',
      name: map['name'] ?? '',
      section: map['section'] ?? '',
    );
  }

  ProfessionEntity toEntity() => ProfessionEntity(
        uuid: uuid,
        name: name,
        section: section.toEntity(),
      );

  factory ProfessionModel.fromEntity(ProfessionEntity entity) {
    return ProfessionModel(
      uuid: entity.uuid,
      name: entity.name,
      section: SectionModel.fromEntity(entity.section),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionModel.fromJson(String source) =>
      ProfessionModel.fromMap(json.decode(source));
}
