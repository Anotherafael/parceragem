import 'dart:convert';

import '../../domain/entities/professional_entity.dart';

class ProfessionalModel {
  final String id;
  final String name;
  final String email;
  final String documentId;
  final String phone;

  ProfessionalModel({
    required this.id,
    required this.name,
    required this.email,
    required this.documentId,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'documentId': documentId,
      'phone': phone,
    };
  }

  factory ProfessionalModel.fromMap(Map<String, dynamic> map) {
    return ProfessionalModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      documentId: map['document_id'],
      phone: map['phone'],
    );
  }

  ProfessionalEntity toEntity() => ProfessionalEntity(
        id: id,
        name: name,
        email: email,
        documentId: documentId,
        phone: phone,
      );

  factory ProfessionalModel.fromEntity(ProfessionalEntity entity) {
    return ProfessionalModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      documentId: entity.documentId,
      phone: entity.phone,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionalModel.fromJson(String source) =>
      ProfessionalModel.fromMap(json.decode(source));
}
