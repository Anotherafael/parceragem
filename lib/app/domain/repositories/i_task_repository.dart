import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/entities/task_entity.dart';

abstract class ITaskRepository {
  Future<Either<ServerFailures, List<TaskEntity>>> getTasks();
}
