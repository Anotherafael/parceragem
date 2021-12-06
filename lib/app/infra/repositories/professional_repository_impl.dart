import 'package:dio/dio.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/entities/profession_entity.dart';
import 'package:parceragem/app/domain/repositories/professional_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/models/profession_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfessionalRepositoryImpl extends ProfessionalRepository {
  final ParceragemClient client;

  ProfessionalRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, Unit>> addProfession(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await client.post(
        'features/add-profession',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
        data: {"profession_id": id},
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

  @override
  Future<Either<ServerFailures, List<ProfessionEntity>>>
      getProfessions() async {
    try {
      final List<ProfessionEntity> professionList = [];
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await client.get(
        'features/professions',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
      );
      final List list = response.data!['data'];

      for (var i = 0; i < list.length; i++) {
        professionList.add(ProfessionModel.fromMap(list[i]).toEntity());
      }

      return right(professionList);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }

  @override
  Future<Either<ServerFailures, String>> getMyProfessions() {
    // TODO: implement getMyProfessions
    throw UnimplementedError();
  }
}
