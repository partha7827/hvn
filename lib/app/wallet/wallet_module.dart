import 'package:highvibe/app/wallet/wallet_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/wallet/wallet_page.dart';

class WalletModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WalletController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => WalletPage()),
      ];

  static Inject get to => Inject<WalletModule>.of();
}
