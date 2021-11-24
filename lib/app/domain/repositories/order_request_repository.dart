import 'package:dartz/dartz.dart';

import '../core/failures/server_failures.dart';
import '../entities/order_entity.dart';

abstract class OrderRequestRepository {
  Future<Either<ServerFailures, List<OrderEntity>>> getOrderRequestsByUser();
  Future<Either<ServerFailures, List<OrderEntity>>>
      getOrderRequestsByProfessional();
  Future<Either<ServerFailures, Unit>> addOrderRequest(String id);
  Future<Either<ServerFailures, String>> cancelOrderRequest();
}
