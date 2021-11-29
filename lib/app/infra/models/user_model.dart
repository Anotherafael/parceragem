import 'dart:convert';

import '../../domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String name;
  final String password;
  final String email;
  final String documentId;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.documentId,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'documentId': documentId,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      password: "sem senha bro",
      email: map['email'],
      documentId: map['document_id'],
      phone: map['phone'],
    );
  }

  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        password: password,
        email: email,
        documentId: documentId,
        phone: phone,
      );

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      password: entity.password,
      email: entity.email,
      documentId: entity.documentId,
      phone: entity.phone,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
