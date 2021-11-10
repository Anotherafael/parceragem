import 'dart:convert';
import 'dart:ffi';

import 'package:parceragem/app/domain/entities/order_entity.dart';
import 'package:parceragem/app/infra/models/professional_model.dart';
import 'package:parceragem/app/infra/models/task_model.dart';

class OrderModel {
  final String uuid;
  final DateTime date;
  final Float price;
  final String status;
  final TaskModel task;
  final ProfessionalModel professional;

  OrderModel({
    required this.uuid,
    required this.date,
    required this.price,
    required this.status,
    required this.task,
    required this.professional,
  });

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'date': date,
      'price': price,
      'status': status,
      'task': task,
      'professional': professional,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      uuid: map['uuid'],
      date: map['date'],
      price: map['price'],
      status: map['status'],
      task: map['task'],
      professional: map['professional'],
    );
  }

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      uuid: entity.uuid,
      date: entity.date,
      price: entity.price,
      status: entity.status,
      task: TaskModel.fromEntity(entity.task),
      professional: ProfessionalModel.fromEntity(entity.professional),
    );
  }

  OrderEntity toEntity() => OrderEntity(
        uuid: uuid,
        date: date,
        price: price,
        status: status,
        task: task.toEntity(),
        professional: professional.toEntity(),
      );

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
