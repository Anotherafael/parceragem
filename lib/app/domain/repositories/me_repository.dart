import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../core/failures/server_failures.dart';

abstract class MeRepository {
  Future<Either<ServerFailures, Equatable>> getMe();
  Future<Either<ServerFailures, Unit>> updateMe(Map<String, dynamic> map);
}
