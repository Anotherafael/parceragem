import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/entities/professional_entity.dart';

abstract class IProfessionalRepository {
  Future<Either<ServerFailures, ProfessionalEntity>> getMe();
  Future<Either<ServerFailures, String>> updateMe();
  Future<Either<ServerFailures, String>> addProfession();
  Future<Either<ServerFailures, String>> getMyProfessions();
}
