import 'package:dartz/dartz.dart';
import 'package:parceragem/app/infra/models/auth_model.dart';

import '../core/failures/server_failures.dart';

abstract class IAuthRepository {
  Future<Either<ServerFailures, LoginResponseModel>> login(
      LoginRequestModel requestModel);
  Future<Either<ServerFailures, String>> register();
  //Future<Either<ServerFailures, String>> forgotPassword();
  //Future<Either<ServerFailures, String>> resetPassword();
}
