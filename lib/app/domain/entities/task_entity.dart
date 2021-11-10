import 'package:equatable/equatable.dart';

import 'profession_entity.dart';

class TaskEntity extends Equatable {
  final String uuid;
  final String name;
  final ProfessionEntity profession;

  TaskEntity({
    required this.uuid,
    required this.name,
    required this.profession,
  });

  @override
  List<Object?> get props => [
        uuid,
        name,
        profession,
      ];
}
