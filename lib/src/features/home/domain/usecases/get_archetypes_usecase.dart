import '../../data/models/archetype.dart';
import '../repositories/archetypes_repository.dart';

class GetOrdersUseCase {
  GetOrdersUseCase({
    required this.repository,
  });
  final OrdersRepository repository;

  Future<List<Archetype>> getArchetypes() async =>
      repository.getArchetypes();
}
