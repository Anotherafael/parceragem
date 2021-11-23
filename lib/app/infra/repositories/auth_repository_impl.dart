import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/repositories/i_auth_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/models/auth_model.dart';

class AuthRepositoryImpl extends IAuthRepository {
  final ParceragemClient client;

  AuthRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, LoginResponseModel>> login(
      LoginRequestModel requestModel) async {
    try {
      final response = await client.post(
        'auth/login/users',
        data: requestModel.toJson(),
      );

      final data = response.data!['data'];
      final dataToJson = LoginResponseModel.fromMap(data);

      return right(dataToJson);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }

  @override
  Future<Either<ServerFailures, String>> register() {
    throw UnimplementedError();
  }
}
