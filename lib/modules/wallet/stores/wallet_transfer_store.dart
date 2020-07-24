import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/model/transaction.dart';
import 'package:highvibe/modules/wallet/service/contract_service.dart';
import 'package:highvibe/modules/wallet/stores/wallet_store.dart';
import 'package:mobx/mobx.dart';
import 'package:web3dart/credentials.dart';

part 'wallet_transfer_store.g.dart';

class WalletTransferStore = WalletTransferStoreBase with _$WalletTransferStore;

abstract class WalletTransferStoreBase with Store {
  WalletTransferStoreBase(this.walletStore, this._contractService);

  final WalletStore walletStore;
  final IContractService _contractService;

  @observable
  String to;
  @observable
  String amount;
  @observable
  ObservableList<String> errors = ObservableList<String>();
  @observable
  bool loading;

  @observable
  String ethGasPrice;

  @observable
  String denomination = 'PBLC';

  @action
  void setTo(String value) {
    to = value;
  }

  @action
  void setAmount(String value) {
    if (value == '') {
      errors.clear();
      loading = true;
    } else {
      if (double.tryParse(value) != null) {
        loading = false;
        amount = value;
      } else {
        errors.clear();
        loading = true;
        errors.add('Amount error: enter a numeric value');
      }
    }
  }

  @action
  void isLoading(bool value) {
    loading = value;
  }

  @action
  void reset() {
    to = '';
    amount = '';
    loading = true;
    errors.clear();
  }

  @action
  void setError(String message) {
    isLoading(false);

    errors.clear();
    errors.add(message);
  }

  @action
  Stream<Transaction> transfer() {
    final controller = StreamController<Transaction>();
    final transactionEvent = Transaction();

    isLoading(true);

    // PBLC is 9 decimals. 1 PBLC = 0,000,000,001 ETH
    final amount = double.parse(this.amount) * pow(10, 9);
    try {
      EthereumAddress.fromHex(to);
    } catch (ex) {
      errors.add('Address format error: ${ex.message}');
      return null;
    }

    _contractService.send(
        walletStore.privateKey,
        EthereumAddress.fromHex(to),
        BigInt.from(amount), onTransfer: (from, to, value) {
      controller.add(transactionEvent.confirmed(from, to, value));
      controller.close();
      isLoading(false);
    }, onError: (dynamic ex) {
      controller.addError(ex);
      isLoading(false);
    }).then(
        (id) => {if (id != null) controller.add(transactionEvent.setId(id))});

    return controller.stream;
  }

  @action
  void transferEth(BuildContext context) {
    var multiplier = 1;
    switch (denomination) {
      case 'wei':
        multiplier = 1;
        break;
      case 'gwei':
        multiplier = pow(10, 9);
        break;
      case 'pwei':
        multiplier = pow(10, 15);
        break;
      case 'ether':
        multiplier = pow(10, 18);
        break;
      default:
        break;
    }
    final amount = double.parse(this.amount) * multiplier;

    _contractService
        .sendEth(walletStore.privateKey, EthereumAddress.fromHex(to),
            BigInt.from(amount))
        .then((id) {
      print('Transaction ETH pending: $id');
      //Navigator.pushNamed(context, '/transactions');
    });
  }

  @action
  Future<void> getEthGasPrice() async {
    await _contractService
        .getEthGasPrice()
        .then((amnt) => ethGasPrice = amnt.getInWei.toString());
  }
}
