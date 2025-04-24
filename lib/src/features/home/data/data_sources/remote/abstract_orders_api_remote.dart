import '../../models/archetype.dart';

abstract class AbstractOrdersApiRemote {
  Future<List<Archetype>> getOrders();
  Future<List<Archetype>> processOrders(List<Archetype> orders); // to
}
