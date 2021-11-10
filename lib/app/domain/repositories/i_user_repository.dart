import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/entities/user_entity.dart';

abstract class IMeRepository {
  Future<Either<ServerFailures, UserEntity>> getMe();
  Future<Either<ServerFailures, String>> updateMe();
}
