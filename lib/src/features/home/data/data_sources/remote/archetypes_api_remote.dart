import '../../models/archetype.dart';

abstract class OrdersApiRemote {
  Future<List<Archetype>> getArchetypes();
  Future<List<Archetype>> processArchetype(List<Archetype> orders); // to
}
