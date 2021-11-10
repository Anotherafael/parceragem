import 'dart:convert';

import 'package:parceragem/app/domain/entities/user_entity.dart';

class UserModel {
  final String uuid;
  final String name;
  final String email;
  final String documentId;
  final String phone;

  UserModel({
    required this.uuid,
    required this.name,
    required this.email,
    required this.documentId,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'email': email,
      'documentId': documentId,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uuid: map['uuid'],
      name: map['name'],
      email: map['email'],
      documentId: map['document_id'],
      phone: map['phone'],
    );
  }

  UserEntity toEntity() => UserEntity(
        uuid: uuid,
        name: name,
        email: email,
        documentId: documentId,
        phone: phone,
      );

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uuid: entity.uuid,
      name: entity.name,
      email: entity.email,
      documentId: entity.documentId,
      phone: entity.phone,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
