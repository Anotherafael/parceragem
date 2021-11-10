import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uuid;
  final String name;
  final String email;
  final String documentId;
  final String phone;

  UserEntity({
    required this.uuid,
    required this.name,
    required this.email,
    required this.documentId,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        uuid,
        name,
        email,
        documentId,
        phone,
      ];
}
