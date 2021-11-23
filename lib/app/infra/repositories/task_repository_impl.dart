import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/core/failures/server_failures.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/i_task_repository.dart';
import '../core/http/parceragem_client.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl extends ITaskRepository {
  final ParceragemClient client;

  TaskRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, List<TaskEntity>>> getTasks(String id) async {
    try {
      final List<TaskEntity> tasksList = [];

      final response = await client.get('service/tasks/$id');
      final List list = response.data!['data'];

      for (var i = 0; i < list.length; i++) {
        tasksList.add(TaskModel.fromMap(list[i]).toEntity());
      }

      return right(tasksList);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }
}
