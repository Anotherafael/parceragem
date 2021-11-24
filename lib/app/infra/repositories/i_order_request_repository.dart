import 'package:dio/dio.dart';
import 'package:parceragem/app/domain/entities/order_entity.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/repositories/order_request_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';

class IOrderRquestRepository extends OrderRequestRepository{
  final ParceragemClient client;

  IOrderRquestRepository(this.client);
  @override
  Future<Either<ServerFailures, String>> addOrderRequest(String id) async {
    try {
      final response = await client.post(
        "/transaction/request-order",
        data: {
          "order_id": id
        }
      );
      final data = response.data!["status"];
      return right("");
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
  Future<Either<ServerFailures, List<OrderEntity>>> getOrderRequestsByProfessional() {
    // TODO: implement getOrderRequestsByProfessional
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailures, List<OrderEntity>>> getOrderRequestsByUser() {
    // TODO: implement getOrderRequestsByUser
    throw UnimplementedError();
  }

}