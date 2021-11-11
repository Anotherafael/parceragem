import 'package:dio/dio.dart';
import 'package:parceragem/app/domain/entities/profession_entity.dart';
import 'package:parceragem/app/domain/repositories/i_profession_repository.dart';
import 'package:parceragem/app/infra/models/profession_model.dart';
import '../../domain/core/failures/server_failures.dart';
import 'package:dartz/dartz.dart';
import '../core/http/ParceragemClient.dart';

class ProfessionRepositoryImpl extends IProfessionRepository {
  final ParceragemClient client;

  ProfessionRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, List<ProfessionEntity>>> getProfessions(
      String id) async {
    try {
      final List<ProfessionEntity> professionList = [];

      final response = await client.get('service/professions/$id');
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
}
