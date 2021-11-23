import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/core/failures/server_failures.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../core/http/parceragem_client.dart';
import '../models/order_model.dart';

class IOrderRepositoryImpl extends OrderRepository {
  final ParceragemClient client;

  IOrderRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, String>> addOrder() {
    // TODO: implement addOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailures, String>> cancelOrder() {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailures, List<OrderEntity>>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailures, List<OrderEntity>>> getOrdersByAuth() {
    // TODO: implement getOrdersByAuth
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailures, List<OrderEntity>>> getPendingOrders(
      String id) async {
    try {
      final List<OrderEntity> orderList = [];

      final response = await client.get('transaction/pending-orders/$id');
      final List list = response.data!['data'];

      for (var i = 0; i < list.length; i++) {
        orderList.add(OrderModel.fromMap(list[i]).toEntity());
      }

      return right(orderList);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }

  @override
  Future<Either<ServerFailures, String>> updateOrder() {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }
}
