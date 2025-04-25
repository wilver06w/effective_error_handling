import '../../domain/repositories/archetypes_repository.dart';
import '../data_sources/remote/archetypes_api_remote.dart';
import '../models/archetype.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  OrdersRepositoryImpl({
    required this.apiRemote,
  });
  final OrdersApiRemote apiRemote;

  @override
  Future<List<Archetype>> getArchetypes() async {
      final List<Archetype> result = await apiRemote.getArchetypes();
      return result;
  }
}
