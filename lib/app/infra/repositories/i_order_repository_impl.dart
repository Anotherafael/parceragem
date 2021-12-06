import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/failures/server_failures.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../core/http/parceragem_client.dart';
import '../models/order_model.dart';

class IOrderRepositoryImpl extends OrderRepository {
  final ParceragemClient client;

  IOrderRepositoryImpl(this.client);
  

  @override
  Future<Either<ServerFailures, Unit>> addOrder(Map<String, dynamic> map) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      await client.post(
        "transaction/order",
        options: Options(
          headers:{
            "authorization": "Bearer $token",
          }
        ),
        data: map
      );
      return right(unit);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }

  @override
  Future<Either<ServerFailures, Unit>> cancelOrder(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      await client.delete(
        "transaction/order/$id",
        options: Options(
          headers:{
            "authorization": "Bearer $token",
          }
        ),
      );
      return right(unit);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }

  @override
  Future<Either<ServerFailures, List<OrderEntity>>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailures, List<OrderEntity>>>
      getOrdersByProfessional() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      final List<OrderEntity> orderList = [];

      final response = await client.get(
        'transaction/myorders',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
      );

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
  Future<Either<ServerFailures, List<OrderEntity>>> getPendingOrders(
      String id) async {
    try {
      final List<OrderEntity> orderList = [];

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await client.get(
        'transaction/pending-orders/$id',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
      );
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
