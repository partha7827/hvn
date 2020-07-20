// import 'package:flushbar/flushbar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/components/form/paper_form.dart';
import 'package:highvibe/modules/wallet/components/form/paper_input.dart';
import 'package:highvibe/modules/wallet/components/form/paper_validation_summary.dart';
import 'package:highvibe/modules/wallet/model/transaction.dart';
import 'package:highvibe/modules/wallet/stores/wallet_transfer_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:highvibe/modules/wallet/utils/eth_amount_formatter.dart';
import 'package:highvibe/modules/wallet/wallet_module.dart';

class WalletTransferPage extends StatefulWidget {
  WalletTransferPage({Key key, this.title = 'Send ETH'}) : super(key: key);

  final String title;

  @override
  _WalletTransferPageState createState() => _WalletTransferPageState();
}

class _WalletTransferPageState
    extends ModularState<WalletTransferPage, WalletTransferStore> {
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.reset();
    _popForm();
  }

  @override
  Widget build(BuildContext context) {
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
        actions: <Widget>[
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/images/transactions.png"),
            ),
            onPressed: WalletModule.toTransactions,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Builder(
          builder: (ctx) => buildForm(ctx),
        ),
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
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bkg2.png"),
                fit: BoxFit.cover,
              ),
              // border: Border.all(),
            ),
            height: 150,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    "Available Balance",
                    style: TextStyle(fontSize: 10.0, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Observer(
                    builder: (_) => Text(
                      "HV ${EthAmountFormatter(controller.walletStore.tokenBalance).format()}",
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .apply(fontSizeDelta: 10, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Observer(
                    builder: (_) => Text(
                      "ETH ${EthAmountFormatter(controller.walletStore.ethBalance).format()}",
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .apply(fontSizeDelta: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return PaperForm(
                      padding: 20,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Please fill in the form below to send money",
                              style: TextStyle(
                                  fontSize: 10.0, color: Color(0xff515151)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: PaperInput(
                                controller: _toController,
                                labelText: 'Address',
                                hintText: 'Type the destination address',
                                filled: true,
                                fillColor: Colors.white,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff515151),
                                ),
                                onChanged: controller.setTo,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: IconButton(
                                icon: ImageIcon(
                                    AssetImage("assets/images/camera.png")),
                                tooltip: 'camera',
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                onPressed: () {
                                  WalletModule.toQrCodeReader(
                                    callback: (ethAddress) async {
                                      controller.setTo(ethAddress);
                                      _popForm();
                                    }
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: PaperInput(
                                controller: _amountController,
                                labelText: 'Amount',
                                hintText: '0',
                                filled: true,
                                fillColor: Colors.white,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff515151),
                                ),
                                onChanged: controller.setAmount,
                              ),
                            ),
                            SizedBox(width: 10),
                            DropdownButton<String>(
                              items: [
                                DropdownMenuItem<String>(
                                  child: Text(
                                    'HV',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff818181),
                                    ),
                                  ),
                                  value: 'HV',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text(
                                    'wei',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff555555),
                                    ),
                                  ),
                                  value: 'wei',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text(
                                    'gwei (Shannon)',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff555555),
                                    ),
                                  ),
                                  value: 'gwei',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text(
                                    'pwei (Finney)',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff555555),
                                    ),
                                  ),
                                  value: 'pwei',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text(
                                    'ether (Buterin)',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff555555),
                                    ),
                                  ),
                                  value: 'ether',
                                ),
                              ],
                              onChanged: (String value) {
                                controller.denomination = value;
                              },
                              hint: Text(
                                "HV",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff818181),
                                ),
                              ),
                              value: controller.denomination ?? "HV",
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        PaperValidationSummary(controller.errors),
                        Opacity(
                          opacity: !controller.loading &&
                                  controller.denomination == "HV"
                              ? 1.0
                              : 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: AssetImage("assets/images/bkg5.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Opacity(
                              opacity: !controller.loading &&
                                      controller.denomination == "HV"
                                  ? 1.0
                                  : 0.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text(
                                      'Send HV',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: !controller.loading &&
                                            controller.denomination == "HV"
                                        ? () {
                                            controller.transfer().listen((tx) {
                                              switch (tx.status) {
                                                case TransactionStatus.started:
                                                  print(
                                                      'transact pending ${tx.key}');
                                                  // showInfoFlushbar(
                                                  //     context, true, tx.key);
                                                  //Navigator.pushNamed(context, '/transactions', arguments: tx.key);
                                                  break;
                                                case TransactionStatus
                                                    .confirmed:
                                                  print(
                                                      'transact confirmed ${tx.key}');
                                                  // showInfoFlushbar(
                                                  //     context, false, tx.key);
                                                  //Navigator.popUntil(context, ModalRoute.withName('/'));
                                                  break;
                                                default:
                                                  break;
                                              }
                                            }).onError((error) => controller
                                                .setError(error.message));
                                          }
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Opacity(
                          opacity: !controller.loading &&
                                  controller.denomination != "HV"
                              ? 1.0
                              : 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: AssetImage("assets/images/bkg5.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Opacity(
                              opacity: !controller.loading &&
                                      controller.denomination != "HV"
                                  ? 1.0
                                  : 0.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text(
                                      'Send ETH',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: !controller.loading &&
                                            controller.denomination != "HV"
                                        ? () {
                                            // showInfoFlushbar(context, true,
                                            //     "actual ETH transaction");
                                            controller.transferEth(context);
                                          }
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Row(
                        //   children: <Widget>[
                        //     RaisedButton(
                        //       child: const Text('get gas price'),
                        //       onPressed: !widget.store.loading
                        //           ? () => widget.store.getEthGasPrice()
                        //           : null,
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     PaperGasPrice(_getEthGasPrice()),
                        //   ],
                        // )
                        SizedBox(height: 20),
                        ListTile(
                          title: Text(
                            'When transfering HV, make sure the receiving address has a HV compliant wallet',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          leading: Icon(Icons.info),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _popForm() {
    _toController.value = TextEditingValue(text: controller.to ?? "");
    _amountController.value = TextEditingValue(text: controller.amount ?? "");
  }

  // String _getEthGasPrice() {
  //   var price = widget.store.ethGasPrice ?? "";
  //   return price;
  // }

  // void showInfoFlushbar(BuildContext context, bool pending, String hash) {
  //   controller.loading = false;
  //   Flushbar(
  //     title: pending ? 'Transaction Pending' : 'Transaction Confirmed',
  //     message: '$hash',
  //     icon: Icon(
  //       Icons.info_outline,
  //       size: 28,
  //       color: Colors.blue.shade300,
  //     ),
  //     leftBarIndicatorColor: Colors.blue.shade300,
  //     duration: Duration(seconds: 3),
  //   )..show(context);
  // }

  @override
  void dispose() {
    _toController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
