import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/components/transactions/transaction_list.dart';
import 'package:highvibe/modules/wallet/stores/wallet_transactions_store.dart';
import 'package:flutter/material.dart';

class WalletTransactionsPage extends StatefulWidget {
  WalletTransactionsPage({Key key, this.title = 'Transactions'})
      : super(key: key);

  final String title;

  @override
  _WalletTransactionsPageState createState() => _WalletTransactionsPageState();
}

class _WalletTransactionsPageState
    extends ModularState<WalletTransactionsPage, WalletTransactionsStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final String hash = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: ImageIcon(
            AssetImage("assets/images/back.png"),
          ),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: Builder(
        builder: (ctx) => buildForm(ctx),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bkg1.png"),
                fit: BoxFit.fill,
              ),
            ),
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            child: null,
          ),
          Expanded(
            child: TransactionList(controller),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("INFO: cancelling timer");
    controller.timer.cancel();
    controller.timer = null;
  }
}
