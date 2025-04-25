import '../../data/models/archetype.dart';

abstract class OrdersRepository {
  Future<List<Archetype>> getArchetypes();
}
