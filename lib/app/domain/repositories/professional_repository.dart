import 'package:dartz/dartz.dart';

import '../core/failures/server_failures.dart';
import '../entities/professional_entity.dart';

abstract class ProfessionalRepository {
  Future<Either<ServerFailures, ProfessionalEntity>> getMe();
  Future<Either<ServerFailures, String>> updateMe();
  Future<Either<ServerFailures, String>> addProfession();
  Future<Either<ServerFailures, String>> getMyProfessions();
}
