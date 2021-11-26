import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/failures/server_failures.dart';
import '../../domain/entities/section_entity.dart';
import '../../domain/repositories/section_repository.dart';
import '../core/http/parceragem_client.dart';
import '../models/section_model.dart';

class ISectionRepositoryImpl extends SectionRepository {
  final ParceragemClient client;

  ISectionRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, List<SectionEntity>>> getSections() async {
    try {
      final List<SectionEntity> sectionList = [];
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      client.options.headers["Authorization"] = "Bearer $token";
      final response = await client.get(
        'service/sections',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
      );
      final List list = response.data!['data'];

      for (var i = 0; i < list.length; i++) {
        sectionList.add(SectionModel.fromMap(list[i]).toEntity());
      }

      return right(sectionList);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }
}
