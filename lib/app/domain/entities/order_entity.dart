import 'package:equatable/equatable.dart';

import 'professional_entity.dart';
import 'task_entity.dart';

class OrderEntity extends Equatable {
  final String id;
  final DateTime date;
  final String hour;
  final double price;
  final String status;
  final TaskEntity task;
  final ProfessionalEntity professional;

  OrderEntity({
    required this.id,
    required this.date,
    required this.hour,
    required this.price,
    required this.status,
    required this.task,
    required this.professional,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        hour,
        price,
        status,
        task,
        professional,
      ];
}
