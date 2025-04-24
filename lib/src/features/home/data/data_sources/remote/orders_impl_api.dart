import 'package:effective_error_handling/src/features/home/data/data_sources/remote/abstract_orders_api_remote.dart';
import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/shared/http/failures.dart';
import 'package:effective_error_handling/src/shared/http/http_client.dart';

class OrdersImplApiRemote extends AbstractOrdersApiRemote {
  OrdersImplApiRemote({
    required this.client,
  });

  final HttpClient client;

  final archetypeUrl = '/v7/archetypes.php*';

  @override
  Future<List<Archetype>> getOrders() async {
    try {
      final response = await client.msDio.get<dynamic>(archetypeUrl);

      final List<dynamic> rawListData = response.data as List<dynamic>;
      final list = rawListData.map((p) => Archetype.fromJson(p)).toList();

      return list;
    } on DioException catch (error) {
      throw DioFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }
}
