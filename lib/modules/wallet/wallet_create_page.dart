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
          onPressed: HomeModule.toHome,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bkg1.png"),
                fit: BoxFit.fill,
              ),
            ),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Mnemonic Setup",
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Generate a new mnemonic or \n import your account",
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
                padding: EdgeInsets.all(10),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Color(0xfff6f6f6),
                    ),
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Text(
                            "12-word bip39 mnemonic",
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xff696969)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Observer(
                              builder: (_) => Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                  child: Text(
                                    controller.mnemonic,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xff858585)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: IconButton(
                                icon: Icon(Icons.content_copy),
                                tooltip: 'copy address',
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(text: controller.mnemonic),
                                  );
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Copied"),
                                    ),
                                  );
                                },
                                color: Color(0xff858585),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffe1e1e1),
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
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/bkg5.png"),
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
                                        WalletModule.toMainPage();
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          title: Text(
                            'Keep your seed phrase somewhere safe and do not lose it! Otherwise you will not be able to retrieve your accounts!',
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
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Color(0xfff6f6f6),
                    ),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Text(
                            "import an account",
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xff696969)),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image: AssetImage("assets/images/bkg5.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                child: const Text(
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
