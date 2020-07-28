import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/pages/wallet/wallet_verify_seed_phrase.dart';
import 'package:highvibe/modules/wallet/stores/wallet_create_store.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class WalletSeedPhrase extends StatefulWidget {
  @override
  _WalletSeedPhraseState createState() => _WalletSeedPhraseState();
}

class _WalletSeedPhraseState
    extends ModularState<WalletSeedPhrase, WalletCreateStore> {
  List<String> _mnemonics;

  @override
  void initState() {
    controller.generateMnemonic();
    _mnemonics = controller.mnemonic.split(' ');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text('Please carefully write down \nthis phrase',
                      style: bold24PlayfairWhite),
                ),
                const SizedBox(height: 22),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 4,
                    crossAxisCount: 2,
                  ),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 12,
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: secondaryColor,
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '${index + 1}.  ${_mnemonics[index]}',
                        style: normal14White,
                      ),
                    );
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Text(
                      'Copy to clipboard',
                      style: normal14Accent,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GradientRaisedButton(
                    label: 'I have written it down',
                    onPressed: toVerifySeedPhrase,
                    radius: 100,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    'We will confirm on the next screen.',
                    style: normal18Purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void toVerifySeedPhrase() {
    Navigator.push(
      context,
      MaterialPageRoute<WalletSeedPhrase>(
          builder: (context) => WalletVerifySeedPhrase(
            mnemonics: _mnemonics,
          )),
    );
  }
}
