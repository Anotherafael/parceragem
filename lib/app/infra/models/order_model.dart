import 'dart:convert';

import '../../domain/entities/order_entity.dart';
import 'professional_model.dart';
import 'task_model.dart';

class OrderModel {
  final String id;
  final DateTime date;
  final String hour;
  final double price;
  final String status;
  final TaskModel task;
  final ProfessionalModel professional;

  OrderModel({
    required this.id,
    required this.date,
    required this.hour,
    required this.price,
    required this.status,
    required this.task,
    required this.professional,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'hour': hour,
      'price': price,
      'status': status,
      'task': task,
      'professional': professional,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      date: DateTime.parse(map['date']),
      hour: map['hour'],
      price: double.parse(map['price'].toString()),
      status: map['status'],
      task: TaskModel.fromMap(map['task']),
      professional: ProfessionalModel.fromMap(map['professional']),
    );
  }

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      date: entity.date,
      hour: entity.hour,
      price: entity.price,
      status: entity.status,
      task: TaskModel.fromEntity(entity.task),
      professional: ProfessionalModel.fromEntity(entity.professional),
    );
  }

  OrderEntity toEntity() => OrderEntity(
        id: id,
        date: date,
        hour: hour,
        price: price,
        status: status,
        task: task.toEntity(),
        professional: professional.toEntity(),
      );

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
