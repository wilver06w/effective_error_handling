import '../shared/http/http_client.dart';
import '../shared/inject.dart';
import '../shared/module.dart';

/// Módulo principal que coordina la inyección de dependencias del feature home.
///
/// Responsabilidades:
/// - Coordina la inyección de dependencias de todas las capas
/// - Asegura que las dependencias estén disponibles en el orden correcto
/// - Mantiene la configuración de inyección de dependencias centralizada
///
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
