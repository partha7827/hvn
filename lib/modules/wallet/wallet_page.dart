import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/main.dart';
import 'package:highvibe/modules/wallet/pages/auth/face/face_page.dart';
import 'package:highvibe/modules/wallet/service/configuration_service.dart';
import 'package:highvibe/modules/wallet/stores/wallet_store.dart';
import 'package:highvibe/modules/wallet/wallet_module.dart';
import 'wallet_controller.dart';

class WalletPage extends StatefulWidget {
  final String title;
  const WalletPage({Key key, this.title = 'Wallet'}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends ModularState<WalletPage, WalletController> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (controller.didSetupWallet) {
        await Modular.get<WalletStore>().initialise();
        await Modular.get<ConfigurationService>()
            .setNetwork(walletConfig.network);

        await WalletModule.toMainPage();
      } else {
        await WalletModule.toCreate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FacePage();
  }
}
