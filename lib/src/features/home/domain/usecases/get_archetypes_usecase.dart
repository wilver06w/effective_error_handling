import '../../../../shared/http/failures.dart';
import '../../data/models/archetype.dart';
import '../repositories/archetypes_repository.dart';

class GetOrdersUseCase {
  GetOrdersUseCase({
    required this.repository,
  });
  final OrdersRepository repository;

  Future<(Failure?, List<Archetype>)> getArchetypes() async =>
      repository.getArchetypes();
}
