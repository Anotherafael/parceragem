import 'dart:convert';

import 'package:parceragem/app/domain/entities/request_order_entity.dart';
import 'package:parceragem/app/infra/models/order_model.dart';
import 'package:parceragem/app/infra/models/user_model.dart';

class RequestOrderModel {
  final int id;
  final String status;
  final OrderModel order;
  final UserModel user;

  RequestOrderModel({
    required this.id,
    required this.status,
    required this.order,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'order': order,
      'user': user,
    };
  }

  factory RequestOrderModel.fromMap(Map<String, dynamic> map) {
    return RequestOrderModel(
      id: map['id'],
      status: map['status'],
      order: map['order'],
      user: map['user'],
    );
  }

  factory RequestOrderModel.fromEntity(RequestOrderEntity entity) {
    return RequestOrderModel(
      id: entity.id,
      status: entity.status,
      order: OrderModel.fromEntity(entity.order),
      user: UserModel.fromEntity(entity.user),
    );
  }

  RequestOrderEntity toEntity() => RequestOrderEntity(
        id: id,
        status: status,
        order: order.toEntity(),
        user: user.toEntity(),
      );

  String toJson() => json.encode(toMap());

  factory RequestOrderModel.fromJson(String source) =>
      RequestOrderModel.fromMap(json.decode(source));
}
