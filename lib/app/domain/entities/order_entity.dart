import 'dart:ffi';

import 'package:equatable/equatable.dart';

import 'professional_entity.dart';
import 'task_entity.dart';

class OrderEntity extends Equatable {
  final String uuid;
  final DateTime date;
  final Float price;
  final String status;
  final TaskEntity task;
  final ProfessionalEntity professional;

  OrderEntity({
    required this.uuid,
    required this.date,
    required this.price,
    required this.status,
    required this.task,
    required this.professional,
  });

  @override
  List<Object?> get props => [
        uuid,
        date,
        price,
        status,
        task,
        professional,
      ];
}
