import 'package:highvibe/modules/wallet/service/configuration_service.dart';
import 'package:mobx/mobx.dart';

part 'wallet_controller.g.dart';

class WalletController = _WalletControllerBase with _$WalletController;

abstract class _WalletControllerBase with Store {
  _WalletControllerBase(this._configurationService);
  final ConfigurationService _configurationService;

  bool get didSetupWallet => _configurationService.didSetupWallet();
}
