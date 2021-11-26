import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/repositories/auth_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IAuthRepositoryImpl extends AuthRepository {
  final ParceragemClient client;

  IAuthRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, LoginResponseModel>> login(
      LoginRequestModel requestModel) async {
    try {
      final response = await client.post(
        'auth/login/${requestModel.provider}',
        data: requestModel.toJson(),
      );

      final data = response.data!['data'];
      final prefs = await SharedPreferences.getInstance();
      final dataToJson = LoginResponseModel.fromMap(data);
      prefs.setString("token", data["access_token"]);
      if (requestModel.provider == 'professionals')
        prefs.setString("profession", data['user']['professions']['id']);
      else
        prefs.setString("profession", "0");
      return right(dataToJson);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }

  @override
  Future<Either<ServerFailures, RegisterResponseModel>> register(
      RegisterRequestModel requestModel) async {
    try {
      final response = await client.post(
        'auth/register/${requestModel.provider}',
        data: requestModel.toJson(),
      );
      final data = response.data!['data'];
      final dataToJson = RegisterResponseModel.fromMap(data);
      return right(dataToJson);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }
}
