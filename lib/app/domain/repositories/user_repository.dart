import 'package:dartz/dartz.dart';

import '../core/failures/server_failures.dart';
import '../entities/user_entity.dart';

abstract class MeRepository {
  Future<Either<ServerFailures, UserEntity>> getMe();
  Future<Either<ServerFailures, String>> updateMe();
}
