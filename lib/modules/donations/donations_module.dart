import 'package:highvibe/modules/donations/donations_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/donations/donations_page.dart';

class DonationsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DonationsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DonationsPage()),
      ];

  static Inject get to => Inject<DonationsModule>.of();
}
