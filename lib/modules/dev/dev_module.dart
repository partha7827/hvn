import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dev_controller.dart';
import 'dev_page.dart';

class DevModule extends ChildModule {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => DevController()),
      ];

  @override
  List<Router<Object>> get routers => [ 
    Router('', child: (context, arguments) => const DevPage())
  ];
}