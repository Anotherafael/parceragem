import 'package:dio/dio.dart';
import '../../domain/entities/profession_entity.dart';
import '../../domain/repositories/profession_repository.dart';
import '../models/profession_model.dart';
import '../../domain/core/failures/server_failures.dart';
import 'package:dartz/dartz.dart';
import '../core/http/parceragem_client.dart';

class IProfessionRepositoryImpl extends ProfessionRepository {
  final ParceragemClient client;

  IProfessionRepositoryImpl(this.client);

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
