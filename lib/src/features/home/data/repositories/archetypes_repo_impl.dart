import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../../domain/repositories/abstract_archetypes_repository.dart';
import '../data_sources/remote/archetypes_impl_api.dart';
import '../models/archetype.dart';

class OrdersRepositoryImpl extends AbstractOrdersRepository {
  OrdersRepositoryImpl({
    required this.apiRemote,
  });
  final OrdersImplApiRemote apiRemote;

  @override
  Future<Either<Failure, List<Archetype>>> getArchetypes() async {
    try {
      final List<Archetype> result = await apiRemote.getArchetypes();
      return Right<Failure, List<Archetype>>(result);
    } on Failure catch (e) {
      return Left<Failure, List<Archetype>>(e);
    }
  }
}
