import 'package:flutter_modular/flutter_modular.dart';

import '../features/home/data/data_sources/remote/orders_impl_api.dart';
import '../features/home/data/repositories/orders_repo_impl.dart';
import '../features/home/domain/repositories/abstract_orders_repository.dart';
import '../features/home/domain/usecases/get_order_usecase.dart';

class DataModule {
  static void binds(Injector i) {
    i.addLazySingleton<OrdersImplApiRemote>(OrdersImplApiRemote.new);
  }
}

class DomainModule {
  static void binds(Injector i) {
    i
      ..addLazySingleton<AbstractOrdersRepository>(OrdersRepositoryImpl.new)
      ..addLazySingleton<GetOrdersUseCase>(GetOrdersUseCase.new);
  }
}

class InjectHome {
  static void binds(Injector i) {
    DataModule.binds(i);
    DomainModule.binds(i);
  }
}
