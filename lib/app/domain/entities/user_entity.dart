import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String password;
  final String email;
  final String documentId;
  final String phone;

  UserEntity({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.documentId,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        password,
        email,
        documentId,
        phone,
      ];
}
