import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/entities/profession_entity.dart';

import '../core/failures/server_failures.dart';

abstract class ProfessionalRepository {
  Future<Either<ServerFailures, Unit>> addProfession(String id);
  Future<Either<ServerFailures, List<ProfessionEntity>>> getProfessions();
  Future<Either<ServerFailures, String>> getMyProfessions();
}
