import 'package:highvibe/modules/wallet/service/address_service.dart';
import 'package:highvibe/modules/wallet/stores/wallet_store.dart';
import 'package:mobx/mobx.dart';

part 'wallet_create_store.g.dart';

class WalletCreateStore = WalletCreateStoreBase with _$WalletCreateStore;

enum WalletCreateSteps { display, confirm }

abstract class WalletCreateStoreBase with Store {
  WalletCreateStoreBase(this.walletStore, this._addressService);

  final WalletStore walletStore;
  final IAddressService _addressService;

  @observable
  String mnemonic;

  @observable
  String mnemonicConfirm;

  @observable
  WalletCreateSteps step = WalletCreateSteps.display;

  @observable
  ObservableList<String> errors = ObservableList<String>();

  @action
  void generateMnemonic() {
    reset();
    mnemonic = _addressService.generateMnemonic();

    mnemonicConfirm = mnemonic;
  }

  @action
  void setMnemonicConfirmation(String value) {
    errors.clear();
    mnemonicConfirm = value;
  }

  @action
  void goto(WalletCreateSteps step) {
    this.step = step;
  }

  @action
  void clearErrors() {
    errors = ObservableList();
  }

  @action
  void reset() {
    mnemonic = null;
    mnemonicConfirm = null;
    errors.clear();
    goto(WalletCreateSteps.display);
  }

  @action
  Future<bool> confirmMnemonic() async {
    if (mnemonicConfirm == mnemonic) {
      await _addressService.setupFromMnemonic(mnemonic);
      await walletStore.initialise();
      return true;
    }
    errors.clear();
    errors.add('Invalid mnemonic, please try again.');

    return false;
  }
}
