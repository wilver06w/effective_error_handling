import '../../models/archetype.dart';

abstract class AbstractOrdersApiRemote {
  Future<List<Archetype>> getArchetypes();
  Future<List<Archetype>> processArchetype(List<Archetype> orders); // to
}
