import 'package:equatable/equatable.dart';

import 'profession_entity.dart';

class TaskEntity extends Equatable {
  final String id;
  final String name;
  final ProfessionEntity profession;

  TaskEntity({
    required this.id,
    required this.name,
    required this.profession,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        profession,
      ];
}
