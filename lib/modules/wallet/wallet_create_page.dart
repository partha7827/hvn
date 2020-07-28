import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/pages/wallet/wallet_restore.dart';
import 'package:highvibe/modules/wallet/pages/wallet/wallet_seed_phrase.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class WalletCreatePage extends StatefulWidget {
  const WalletCreatePage({
    this.title = 'HVN Wallet',
  });

  final String title;

  @override
  State<StatefulWidget> createState() => _WalletCreatePage();
}

class _WalletCreatePage
    extends State<WalletCreatePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: 
      _walletBody(),
    );
  }

  Stack _walletBody() {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 120, left: 20, bottom: 32),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            color: secondaryColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'HV Wallet',
                style: bold18PlayfairWhite,
              ),
              const SizedBox(height: 40),
              Text(
                Strings.setupHvnWallet,
                style: normal14White,
              ),
              const SizedBox(height: 40),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 16),
                      child: GradientRaisedButton(
                        label: 'Create',
                        onPressed: toSeedPhrase,
                        radius: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 16),
                      child: GradientRaisedButton(
                        label: 'Restore',
                        onPressed: toRestoreWallet,
                        radius: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          right: 0,
          top: 0,
          child: Container(
            height: 225,
            child: Image.asset('assets/ic_card_bg.png'),
          ),
        ),
      ],
    );
  }

  void toSeedPhrase() {
    Navigator.push(
      context,
      MaterialPageRoute<WalletSeedPhrase>(
          builder: (context) => WalletSeedPhrase()),
    );
  }

  void toRestoreWallet() {
    Navigator.push(
      context,
      MaterialPageRoute<WalletRestore>(
          builder: (context) => WalletRestore()),
    );
  }
}
