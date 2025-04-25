import '../../../../shared/http/failures.dart';
import '../../data/models/archetype.dart';

abstract class OrdersRepository {
  Future<(Failure?, List<Archetype>)> getArchetypes();
}
