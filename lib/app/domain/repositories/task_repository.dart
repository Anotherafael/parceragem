import 'package:dartz/dartz.dart';

import '../core/failures/server_failures.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<ServerFailures, List<TaskEntity>>> getTasks(String id);
}
