import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/home_module.dart';
import 'package:highvibe/modules/wallet/components/transactions/transaction_list.dart';
import 'package:highvibe/modules/wallet/pages/widgets/buttons/main_button.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';
import 'package:highvibe/modules/wallet/stores/wallet_store.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/stores/wallet_transactions_store.dart';
import 'package:highvibe/modules/wallet/utils/eth_amount_formatter.dart';
import 'package:highvibe/modules/wallet/wallet_module.dart';
import 'package:highvibe/values/themes.dart';

class WalletMainPage extends StatefulWidget {
  WalletMainPage({Key key, this.title = 'HVN Wallet', this.currentNetwork})
      : super(key: key);

  final String title;
  final String currentNetwork;

  @override
  _WalletMainPageState createState() => _WalletMainPageState();
}

class _WalletMainPageState extends ModularState<WalletMainPage, WalletStore> {
  void refreshBalance() async {
    await controller.fetchOwnBalance();
  }

  void getUserInfo() async {
    await controller.getUserInfo(context);
  }

  @override
  void initState() {
    super.initState();
    refreshBalance();
    getUserInfo();
  }

  Widget buildHeader() {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: const BoxDecoration(
          color: AppColors.backgroundLightBlue,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: width * 0.4,
              height: width * 0.4,
              child: const Icon(Icons.star, color: Colors.white),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: const BackButton(
                    color: Colors.white,
                    onPressed: HomeModule.toHome,
                  )),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, right: 20, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      const Text(
                        'Wallet Balance',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                    ]),
                    Text(
                      controller.address,
                      style: normal12White,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Observer(
                        builder: (_) {
                          final amount =
                              EthAmountFormatter(controller.tokenBalance);
                          return Text(
                            '${amount.format()}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 42),
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 40),
                      child: Text(
                        'HV TOKENS',
                        style:
                            TextStyle(color: AppColors.textGrey, fontSize: 14),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: MainButton(
                          title: 'Send',
                          icon: const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          onPressed: WalletModule.toTransfer,
                        )),
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        Expanded(
                          child: MainButton(
                            title: 'Receive',
                            icon: const Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                            onPressed: WalletModule.toReceive,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTransactionsHeader() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 5, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Recent Transactions',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: FlatButton(
              onPressed: WalletModule.toTransactions,
              child: Text(
                'See All',
                style: TextStyle(fontSize: 14, color: AppColors.textGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransactions() {
    return TransactionList(Modular.get<WalletTransactionsStore>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          buildTransactionsHeader(),
          buildTransactions()
        ],
      ),
    );
  }
}
