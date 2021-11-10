import 'dart:convert';

import 'package:parceragem/app/domain/entities/section_entity.dart';

class SectionModel {
  String uuid;
  String name;

  SectionModel({
    required this.uuid,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      uuid: map['uuid'] ?? '',
      name: map['name'] ?? '',
    );
  }

  SectionEntity toEntity() => SectionEntity(
        uuid: uuid,
        name: name,
      );

  factory SectionModel.fromEntity(SectionEntity entity) {
    return SectionModel(
      uuid: entity.uuid,
      name: entity.name,
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionModel.fromJson(String source) =>
      SectionModel.fromMap(json.decode(source));
}
