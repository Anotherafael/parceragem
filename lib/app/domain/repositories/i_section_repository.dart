import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/entities/section_entity.dart';

abstract class ISectionRepository {
  Future<Either<ServerFailures, List<SectionEntity>>> getSections();
}
