import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/entities/order_entity.dart';

abstract class IOrderRequestRepository {
  Future<Either<ServerFailures, List<OrderEntity>>> getOrderRequestsByUser();
  Future<Either<ServerFailures, List<OrderEntity>>>
      getOrderRequestsByProfessional();
  Future<Either<ServerFailures, String>> addOrderRequest();
  Future<Either<ServerFailures, String>> cancelOrderRequest();
}
