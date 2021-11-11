import 'package:equatable/equatable.dart';

import 'section_entity.dart';

class ProfessionEntity extends Equatable {
  final String id;
  final String name;
  final SectionEntity section;

  ProfessionEntity({
    required this.id,
    required this.name,
    required this.section,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        section,
      ];
}
