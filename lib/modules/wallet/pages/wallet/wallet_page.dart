import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';
import 'package:highvibe/modules/wallet/pages/receive/receive_page.dart';
import 'package:highvibe/modules/wallet/pages/transactions/transactions_page.dart';
import 'package:highvibe/modules/wallet/pages/users/users_page.dart';
import 'package:highvibe/modules/wallet/pages/widgets/buttons/main_button.dart';
import 'package:highvibe/modules/wallet/pages/widgets/containers/transaction_container.dart';

class WalletPage extends StatefulWidget {
  @override
  WalletPageState createState() => WalletPageState();
}

class WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
  }

  void onBack() {
    Navigator.pop(context);
  }

  void onSend() {
    Navigator.push(
      context,
      MaterialPageRoute<UsersPage>(builder: (context) => UsersPage()),
    );
  }

  void onReceive() {
    Navigator.push(
      context,
      MaterialPageRoute<ReceivePage>(builder: (context) => ReceivePage()),
    );
  }

  void onSeeAll() {
    Navigator.push(
      context,
      MaterialPageRoute<TransactionsPage>(
        builder: (context) => TransactionsPage(),
      ),
    );
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
        child: Stack(children: [
          Container(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: width * 0.4,
              height: width * 0.4,
              child: Icon(
                Icons.star,
                color: Colors.white,
              ),
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: BackButton(
                      color: Colors.white,
                      onPressed: onBack,
                    )),
                Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 20, right: 20, bottom: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Wallet Balance',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              '20,653',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 42),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 40),
                            child: Text(
                              'HV TOKENS',
                              style: TextStyle(
                                  color: AppColors.textGrey, fontSize: 14),
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
                                onPressed: onSend,
                              )),
                              const Padding(padding: EdgeInsets.only(left: 20)),
                              Expanded(
                                  child: MainButton(
                                title: 'Receive',
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                                onPressed: onReceive,
                              ))
                            ],
                          )
                        ]))
              ])
        ]));
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
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 4),
                child: FlatButton(
                  onPressed: onSeeAll,
                  child: const Text(
                    'See All',
                    style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                  ),
                ))
          ]),
    );
  }

  Widget buildTransactions() {
    return Expanded(
        child: ListView(
            padding: const EdgeInsets.only(),
            children: List.generate(30, (index) {
              return TransactionContainer(
                margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
              );
            })));
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
