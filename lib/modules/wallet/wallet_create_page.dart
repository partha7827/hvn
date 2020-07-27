import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/home_module.dart';
import 'package:highvibe/modules/wallet/stores/wallet_create_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:highvibe/modules/wallet/wallet_module.dart';

class WalletCreatePage extends StatefulWidget {
  WalletCreatePage({
    this.title = 'HVN Wallet',
  });

  final String title;

  @override
  State<StatefulWidget> createState() => _WalletCreatePage();
}

class _WalletCreatePage
    extends ModularState<WalletCreatePage, WalletCreateStore> {
  @override
  void initState() {
    super.initState();
    controller.generateMnemonic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: HomeModule.toHome,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Builder(
          builder: (context) => buildForm(context),
          // return widget.store.step == WalletCreateSteps.display
          //     ? _displayMnemonic()
          //     : _confirmMnemonic();
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bkg1.png'),
                fit: BoxFit.fill,
              ),
            ),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Mnemonic Setup',
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Generate a new mnemonic or \n import your account',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xfff6f6f6),
                    ),
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: const Text(
                            '12-word bip39 mnemonic',
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xff696969)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Observer(
                              builder: (_) => Expanded(
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                                  child: Text(
                                    controller.mnemonic,
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xff858585)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: IconButton(
                                icon: Icon(Icons.content_copy),
                                tooltip: 'copy address',
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(text: controller.mnemonic),
                                  );
                                  Scaffold.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Copied'),
                                    ),
                                  );
                                },
                                color: const Color(0xff858585),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffe1e1e1),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: FlatButton(
                                    child: const Text(
                                      'Generate New',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff818181),
                                      ),
                                    ),
                                    onPressed: () async {
                                      controller.generateMnemonic();
                                    }),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/bkg5.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: FlatButton(
                                    child: const Text(
                                      'Confirm',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (await controller.confirmMnemonic()) {
                                        await WalletModule.toMainPage();
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          title: const Text(
                            '''Keep your seed phrase somewhere safe and do not lose it! Otherwise you will not be able to retrieve your accounts!''',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          leading: Icon(Icons.info),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xfff6f6f6),
                    ),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: const Text(
                            'import an account',
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xff696969)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/bkg5.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const FlatButton(
                                child: Text(
                                  'Import Account',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: WalletModule.toImport,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
