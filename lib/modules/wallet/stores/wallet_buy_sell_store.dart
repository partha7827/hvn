import 'dart:async';
import 'dart:math';
import 'package:highvibe/modules/wallet/model/transaction.dart';
import 'package:highvibe/modules/wallet/service/contract_service.dart';
import 'package:highvibe/modules/wallet/stores/wallet_store.dart';
import 'package:mobx/mobx.dart';

part 'wallet_buy_sell_store.g.dart';

class WalletBuySellStore = WalletBuySellStoreBase with _$WalletBuySellStore;

abstract class WalletBuySellStoreBase with Store {
  WalletBuySellStoreBase(this.walletStore, this._contractService);

  final WalletStore walletStore;
  final IContractService _contractService;

  @observable
  String amount;

  @observable
  ObservableList<String> errors = ObservableList<String>();

  @observable
  bool loading;

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
  Stream<Transaction> buy() {
    final controller = StreamController<Transaction>();
    final transactionEvent = Transaction();

    isLoading(true);

    // PBLC is 9 decimals. 1 PBLC = 0,000,000,001 ETH
    // The amount we put in is in unit for 1 PBLC,
    // so if we put 1 we mean 1.000.000.000 wei
    final amount = double.tryParse(this.amount) * pow(10, 9);

    _contractService.buy(walletStore.privateKey, BigInt.from(amount),
        onTransfer: (from, to, value) {
      controller.add(transactionEvent.confirmed(from, to, value));
      controller.close();
      isLoading(false);
    }, onError: (dynamic ex) {
      controller.addError(ex);
      isLoading(false);
    }).then((id) {
      if (id != null) controller.add(transactionEvent.setId(id));
    });

    return controller.stream;
  }

  @action
  Stream<Transaction> sell() {
    final controller = StreamController<Transaction>();
    final transactionEvent = Transaction();

    isLoading(true);

    // PBLC is 9 decimals. 1 PBLC = 0,000,000,001 ETH
    // The amount we put in is in unit for 1 PBLC,
    // so if we put 1 we mean 1.000.000.000 wei
    final amount = double.parse(this.amount) * pow(10, 9);

    _contractService.sell(walletStore.privateKey, BigInt.from(amount),
        onTransfer: (from, to, value) {
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
}
