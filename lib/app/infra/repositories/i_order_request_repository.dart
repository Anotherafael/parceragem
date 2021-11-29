import 'package:dio/dio.dart';
import 'package:parceragem/app/domain/entities/order_entity.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/entities/request_order_entity.dart';
import 'package:parceragem/app/domain/repositories/order_request_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/models/request_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IOrderRequestRepositoryImpl extends OrderRequestRepository {
  final ParceragemClient client;

  IOrderRequestRepositoryImpl(this.client);
  @override
  Future<Either<ServerFailures, Unit>> addOrderRequest(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await client.post(
        "/transaction/request-order",
        data: {"order_id": id},
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
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
  Future<Either<ServerFailures, String>> cancelOrderRequest() {
    // TODO: implement cancelOrderRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailures, List<RequestOrderEntity>>>
      getMyRequests() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      String? provider = prefs.getString("provider");

      final List<RequestOrderEntity> orderRequestList = [];

      final response = await client.get(
        'transaction/myrequests/$provider',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
      );

      final List list = response.data!['data'];

      for (var i = 0; i < list.length; i++) {
        orderRequestList.add(RequestOrderModel.fromMap(list[i]).toEntity());
      }

      return right(orderRequestList);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }

  @override
  Future<Either<ServerFailures, List<RequestOrderEntity>>>
      getOrderRequestsByUser() {
    // TODO: implement getOrderRequestsByUser
    throw UnimplementedError();
  }
}
