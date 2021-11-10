import 'package:equatable/equatable.dart';

class SectionEntity extends Equatable {
  final String uuid;
  final String name;

  SectionEntity({
    required this.uuid,
    required this.name,
  });

  @override
  List<Object?> get props => [
        uuid,
        name,
      ];
}
