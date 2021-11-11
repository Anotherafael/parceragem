import 'package:equatable/equatable.dart';

class ProfessionalEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String documentId;
  final String phone;

  ProfessionalEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.documentId,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        documentId,
        phone,
      ];
}
