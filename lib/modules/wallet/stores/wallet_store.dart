import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/wallet/app_config.dart';
import 'package:highvibe/modules/wallet/model/transaction.dart';
import 'package:highvibe/modules/wallet/service/address_service.dart';
import 'package:highvibe/modules/wallet/service/configuration_service.dart';
import 'package:highvibe/modules/wallet/service/contract_service.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:mobx/mobx.dart';
import 'package:web3dart/credentials.dart';

part 'wallet_store.g.dart';

class WalletStore = WalletStoreBase with _$WalletStore;

abstract class WalletStoreBase with Store {
  WalletStoreBase(
    this._contractService,
    this._addressService,
    this._configurationService,
  );

  final IContractService _contractService;
  final IAddressService _addressService;
  final IConfigurationService _configurationService;

  @observable
  BigInt tokenBalance;

  @observable
  BigInt ethBalance;

  @observable
  BigInt ethGasPrice;

  @observable
  String address;

  @observable
  String privateKey;

  @observable
  ObservableList<Transaction> transactions = ObservableList<Transaction>();

  @observable
  String username = '';

  @action
  Future<void> initialise() async {
    final entropyMnemonic = _configurationService.getMnemonic();
    final privateKey = _configurationService.getPrivateKey();

    if (entropyMnemonic != null && entropyMnemonic.isNotEmpty) {
      await _initialiseFromMnemonic(entropyMnemonic);
      return;
    }

    await _initialiseFromPrivateKey(privateKey);
  }

  Future<void> _initialiseFromMnemonic(String entropyMnemonic) async {
    final mnemonic = _addressService.entropyToMnemonic(entropyMnemonic);
    final privateKey = _addressService.getPrivateKey(mnemonic);
    final address = await _addressService.getPublicAddress(privateKey);

    this.address = address.toString();
    this.privateKey = privateKey;

    await _initialise();
  }

  Future<void> _initialiseFromPrivateKey(String privateKey) async {
    try {
      final address = await _addressService.getPublicAddress(privateKey);

      this.address = address.toString();
      this.privateKey = privateKey;

      await _initialise();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _initialise() async {
    await fetchOwnBalance();

    _contractService.listenTransfer((from, to, value) async {
      final fromMe = from.toString() == address;
      final toMe = to.toString() == address;

      if (!fromMe && !toMe) {
        return;
      }

      await fetchOwnBalance();
    });
  }

  @action
  Future<void> fetchOwnBalance() async {
    final tokenBalance = await _contractService
        .getTokenBalance(EthereumAddress.fromHex(address));
    final ethBalance =
        await _contractService.getEthBalance(EthereumAddress.fromHex(address));

    this.tokenBalance = tokenBalance * BigInt.from(pow(10, 9));
    this.ethBalance = ethBalance.getInWei;
  }

  @action
  Future<void> resetWallet() async {
    await _configurationService.setMnemonic(null);
    await _configurationService.setupDone(false);

    transactions.clear();
  }

  @action
  Future<void> fetchEthGasPrice() async {
    final gasPrice = await _contractService.getEthGasPrice();

    ethGasPrice = gasPrice.getInWei;
  }

  @action
  Future<void> getUserInfo(BuildContext context) async {
    username = Modular.get<AppController>().currentUser.name;
  }

  @action
  Future<void> signOut(BuildContext context) async {
    await Modular.get<AuthService>().logout();
  }

  @action
  Future<void> deleteUser(BuildContext context) async {
    await Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @action
  Stream<Transaction> transfer() {
    final controller = StreamController<Transaction>();
    final transactionEvent = Transaction();

    final amount = BigInt.from(tokenBalance / BigInt.from(pow(10, 9)));
    final network = Modular.get<ConfigurationService>().getNetwork();
    final contractAddress = AppConfig().params[network].contractAddress;

    _contractService.send(
        privateKey, EthereumAddress.fromHex(contractAddress), amount,
        onTransfer: (from, to, value) {
      controller.add(transactionEvent.confirmed(from, to, value));
      controller.close();
    }, onError: (dynamic ex) {
      controller.addError(ex);
    }).then(
        (id) => {if (id != null) controller.add(transactionEvent.setId(id))});

    return controller.stream;
  }
}
