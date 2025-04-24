import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../../data/models/archetype.dart';

abstract class AbstractOrdersRepository {
  Future<Either<Failure, List<Archetype>>> getOrders();
}
