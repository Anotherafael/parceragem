import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/entities/profession_entity.dart';

abstract class IProfessionRepository {
  Future<Either<ServerFailures, List<ProfessionEntity>>> getProfessions();
}
