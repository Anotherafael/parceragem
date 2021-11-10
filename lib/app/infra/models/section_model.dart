import 'dart:convert';

import 'package:parceragem/app/domain/entities/section_entity.dart';

class SectionModel {
  String id;
  String name;

  SectionModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  SectionEntity toEntity() => SectionEntity(
        id: id,
        name: name,
      );

  factory SectionModel.fromEntity(SectionEntity entity) {
    return SectionModel(
      id: entity.id,
      name: entity.name,
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionModel.fromJson(String source) =>
      SectionModel.fromMap(json.decode(source));
}
