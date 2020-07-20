import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_module.dart';
import 'package:highvibe/modules/wallet/app_config.dart';
import 'package:highvibe/modules/wallet/utils/contract_parser.dart';
import 'package:highvibe/values/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/contracts.dart';

var infuraApiKey = "cd8401520b5e4bce93716ee0eebf277a";

AppConfigParams walletConfig = AppConfigParams(
    "https://mainnet.infura.io/v3/$infuraApiKey",
    "wss://mainnet.infura.io/ws/v3/$infuraApiKey",
    "0x141abb03f001deded9a0223d4ff26d929117b72e",
    "mainnet");
SharedPreferences sharedPrefs;
DeployedContract contract;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: primaryColor,
      statusBarColor: Colors.transparent,
    ),
  );

  sharedPrefs = await SharedPreferences.getInstance();

  contract = await ContractParser.fromAssets(
    'assets/HighVibeToken.json',
    walletConfig.contractAddress,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      ModularApp(
        module: AppModule(),
      ),
    ),
  );
}
