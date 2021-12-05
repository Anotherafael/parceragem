import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:parceragem/app/domain/entities/professional_entity.dart';
import 'package:parceragem/app/domain/entities/user_entity.dart';
import 'package:parceragem/app/domain/repositories/me_repository.dart';
import 'package:parceragem/app/infra/models/professional_model.dart';
import 'package:parceragem/app/infra/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/failures/server_failures.dart';
import '../core/http/parceragem_client.dart';

class MeRepositoryImpl extends MeRepository {
  final ParceragemClient client;

  MeRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, Equatable>> getMe() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final provider = prefs.getString('provider');

      final response = await client.get(
        'me',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
      );
      final map = response.data!['data'];
      if (provider == "users") {
        UserEntity user = UserModel.fromMap(map).toEntity();
        return right(user);
      } else {
        ProfessionalEntity user = ProfessionalModel.fromMap(map).toEntity();
        return right(user);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }

  @override
  Future<Either<ServerFailures, Unit>> updateMe(
      Map<String, dynamic> map) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await client.post(
        'me/update',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
        data: map,
      );
      final data = response.data!['data'];

      return right(unit);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }
}
