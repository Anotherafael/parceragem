import 'package:equatable/equatable.dart';

import 'section_entity.dart';

class ProfessionEntity extends Equatable {
  final String uuid;
  final String name;
  final SectionEntity section;

  ProfessionEntity({
    required this.uuid,
    required this.name,
    required this.section,
  });

  @override
  List<Object?> get props => [
        uuid,
        name,
        section,
      ];
}
