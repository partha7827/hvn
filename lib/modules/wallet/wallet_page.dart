import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/pages/auth/face/face_page.dart';
import 'wallet_controller.dart';

class WalletPage extends StatefulWidget {
  final String title;
  const WalletPage({Key key, this.title = 'Wallet'}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends ModularState<WalletPage, WalletController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return FacePage();
  }
}
