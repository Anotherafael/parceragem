import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/core/failures/server_failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../core/http/parceragem_client.dart';
import '../models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IAuthRepositoryImpl extends AuthRepository {
  final ParceragemClient client;
  IAuthRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, LoginResponseModel>> login(
    LoginRequestModel requestModel,
  ) async {
    try {
      final response = await client.post(
        'auth/login/${requestModel.provider}',
        data: requestModel.toJson(),
      );
      final data = response.data!['data'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("user", data['user']['name']);
      prefs.setString("provider", requestModel.provider);
      prefs.setString("token", data["access_token"]);
      final dataToJson = LoginResponseModel.fromMap(data);
      if (requestModel.provider == 'professionals')
        prefs.setString("profession", data['user']['professions'][0]['id']);
      else
        prefs.setString("profession", "0");
      return right(dataToJson);
    } on DioError catch (e) {
      final prefs = await SharedPreferences.getInstance();
      prefs.reload();
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

  @override
  Future<Either<ServerFailures, Unit>> logout() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      await client.post("auth/logout",
          options: Options(headers: {
            "authorization": "Bearer $token",
          }));
      return right(unit);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }
}
