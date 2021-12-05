import 'package:dartz/dartz.dart';
import '../entities/request_order_entity.dart';

import '../core/failures/server_failures.dart';

abstract class OrderRequestRepository {
  Future<Either<ServerFailures, List<RequestOrderEntity>>> getMyRequests();
  Future<Either<ServerFailures, Unit>> addOrderRequest(String id);
  Future<Either<ServerFailures, String>> cancelOrderRequest();
  Future<Either<ServerFailures, Unit>> acceptRequest(int id);
  Future<Either<ServerFailures, Unit>> rejectRequest(int id);
}
