import 'package:highvibe/modules/wallet/wallet_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/wallet_page.dart';

class WalletModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WalletController()),
      ];

  @override
  List<Router> get routers => [
        Router('/wallet', child: (_, args) => const WalletPage()),
      ];

  static Inject get to => Inject<WalletModule>.of();
}
