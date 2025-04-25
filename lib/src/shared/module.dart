import 'package:flutter/material.dart';

import '../features/home/presentation/page.dart' as home;
import 'http/http_client.dart';

class GlobalModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (BuildContext context) => const home.Page(),
    );
  }
}
