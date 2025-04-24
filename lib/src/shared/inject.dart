import 'package:flutter_modular/flutter_modular.dart';

import '../features/home/data/data_sources/remote/orders_impl_api.dart';
import '../features/home/data/repositories/orders_repo_impl.dart';
import '../features/home/domain/repositories/abstract_orders_repository.dart';
import '../features/home/domain/usecases/get_order_usecase.dart';

/// Módulo que contiene las dependencias de la capa de datos.
///
/// Responsabilidades:
/// - Proporciona implementaciones concretas de fuentes de datos
/// - Maneja la comunicación con APIs externas
/// - Gestiona el almacenamiento local si es necesario
class DataModule {
  static void binds(Injector i) {
    /// Cliente remoto para obtener órdenes desde la API
    /// Implementa la lógica de comunicación HTTP y manejo de errores
    i.addLazySingleton<OrdersImplApiRemote>(OrdersImplApiRemote.new);
  }
}

/// Módulo que contiene las dependencias de la capa de dominio.
///
/// Responsabilidades:
/// - Proporciona implementaciones de repositorios
/// - Registra casos de uso
/// - Mantiene la lógica de negocio aislada
class DomainModule {
  static void binds(Injector i) {
    /// Implementación concreta del repositorio de órdenes
    /// Maneja la lógica de negocio para el acceso a datos de órdenes
    i.addLazySingleton<AbstractOrdersRepository>(OrdersRepositoryImpl.new);

    /// Caso de uso para obtener órdenes
    /// Encapsula la lógica de negocio para la obtención de órdenes
    i.addLazySingleton<GetOrdersUseCase>(GetOrdersUseCase.new);
  }
}

/// Módulo principal que coordina la inyección de dependencias del feature home.
///
/// Responsabilidades:
/// - Coordina la inyección de dependencias de todas las capas
/// - Asegura que las dependencias estén disponibles en el orden correcto
/// - Mantiene la configuración de inyección de dependencias centralizada
class InjectHome {
  static void binds(Injector i) {
    DataModule.binds(i);
    DomainModule.binds(i);
  }
}
