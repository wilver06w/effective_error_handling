import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/shared/http/failures.dart';

abstract class AbstractOrdersRepository {
  Future<(Failure?, List<Archetype>)> getOrders();
}
