import 'package:equatable/equatable.dart';
import 'package:parceragem/app/domain/entities/order_entity.dart';
import 'package:parceragem/app/domain/entities/user_entity.dart';

class RequestOrderEntity extends Equatable {
  final int id;
  final String status;
  final OrderEntity order;
  final UserEntity user;

  RequestOrderEntity({
    required this.id,
    required this.status,
    required this.order,
    required this.user,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        order,
        user,
      ];
}
