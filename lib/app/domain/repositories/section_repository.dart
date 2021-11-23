import 'package:dartz/dartz.dart';

import '../core/failures/server_failures.dart';
import '../entities/section_entity.dart';

abstract class SectionRepository {
  Future<Either<ServerFailures, List<SectionEntity>>> getSections();
}
