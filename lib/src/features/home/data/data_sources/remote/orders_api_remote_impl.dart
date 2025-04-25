import '../../../../../shared/http/http_client.dart';
import '../../models/archetype.dart';
import 'archetypes_api_remote.dart';

class OrdersApiRemoteImpl extends OrdersApiRemote {
  OrdersApiRemoteImpl({
    required this.client,
  });

  final HttpClient client;

  final String archetypeUrl = '/v7/archetypes.php';

  @override
  Future<List<Archetype>> getArchetypes() async {
    final Response<dynamic> response =
        await client.msDio.get<dynamic>(archetypeUrl);

    final List<dynamic> rawListData = response.data as List<dynamic>;

    final List<Archetype> list = rawListData
        .map((dynamic p) => Archetype.fromJson(p as Map<String, dynamic>))
        .toList();

    return list;
  }

  @override
  Future<List<Archetype>> processArchetype(List<Archetype> orders) async {
    final Response<dynamic> response = await client.msDio.post<dynamic>(
      archetypeUrl,
      data: orders.map((Archetype e) => e.toJson()).toList(),
    );

    final List<dynamic> rawListData = response.data as List<dynamic>;

    final List<Archetype> list = rawListData
        .map((dynamic p) => Archetype.fromJson(p as Map<String, dynamic>))
        .toList();

    return list;
  }
}
