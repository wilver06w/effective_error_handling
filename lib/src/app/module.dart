import '../shared/inject.dart';
import '../shared/http/http_client.dart';
import '../shared/module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<HttpClient>(HttpClient.new);

    InjectHome.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      '/',
      module: GlobalModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
