import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../../data/models/archetype.dart';
import '../repositories/abstract_archetypes_repository.dart';

class GetOrdersUseCase {
  GetOrdersUseCase({
    required this.repository,
  });
  final AbstractOrdersRepository repository;

  Future<Either<Failure, List<Archetype>>> getArchetypes() async =>
      repository.getArchetypes();
}
