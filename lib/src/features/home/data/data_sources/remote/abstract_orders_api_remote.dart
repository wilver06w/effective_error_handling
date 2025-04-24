import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';

abstract class AbstractOrdersApiRemote {
  Future<List<Archetype>> getOrders();
}
