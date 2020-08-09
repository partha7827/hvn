import 'package:flutter/services.dart';
import 'package:highvibe/modules/wallet/stores/wallet_store.dart';
import 'package:highvibe/modules/wallet/utils/eth_amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:highvibe/values/themes.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Balance extends StatelessWidget {
  Balance(this.store);
  final WalletStore store;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bkg1.png'),
                fit: BoxFit.fill,
              ),
            ),
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            child: null,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xfff6f6f6),
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                            child: Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 10.0, color: Color(0xff818181)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.72,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    store.address,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xff818181)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: IconButton(
                                    icon: const Icon(Icons.content_copy),
                                    iconSize: 20,
                                    tooltip: 'copy address',
                                    onPressed: () {
                                      Clipboard.setData(
                                        ClipboardData(text: store.address),
                                      );
                                      Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Copied'),
                                        ),
                                      );
                                    },
                                    color: const Color(0xff818181),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    QrImage(
                      data: store.address,
                      size: MediaQuery.of(context).size.width * 0.4,
                    ),
                    const SizedBox(height: 50),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bkg2.png'),
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
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: Text(
                              'Available Balance',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: Text(
                                'HV',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Observer(
                                builder: (_) => Text(
                                  '''${EthAmountFormatter(store.tokenBalance).format()}''',
                                  style: normal18White,
                                ),
                              ),
                            ),
                          ),
                          // Center(
                          //   child: Padding(
                          //     padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          //     child: Observer(
                          //       builder: (_) => Text(
                          //         "${EthAmountFormatter(store.ethBalance)
                          // .format()} ETH",
                          //         style: TextStyle(
                          //           fontSize: 15.0,
                          //           color: Colors.white,
                          //           fontStyle: FontStyle.italic,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bkg2.png'),
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
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: Text(
                              'Available Balance',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: Text(
                                'ETH',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Observer(
                                builder: (_) => Text(
                                  '''${EthAmountFormatter(store.ethBalance).format()}''',
                                  style: normal16White,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
