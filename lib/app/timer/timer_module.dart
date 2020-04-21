import 'package:highvibe/app/timer/timer_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/timer/timer_page.dart';

class TimerModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TimerController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TimerPage()),
      ];

  static Inject get to => Inject<TimerModule>.of();
}
