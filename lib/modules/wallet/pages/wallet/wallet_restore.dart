import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/components/form/paper_validation_summary.dart';
import 'package:highvibe/modules/wallet/wallet_module.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/modules/wallet/stores/wallet_import_store.dart';

class WalletRestore extends StatefulWidget {
  @override
  _WalletRestoreState createState() => _WalletRestoreState();
}

class _WalletRestoreState
    extends ModularState<WalletRestore, WalletImportStore> {
  bool isValidSeedPhrase = false;

  @override
  void initState() {
    super.initState();
    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Restore from Seed',
                    style: bold24PlayfairWhite,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    Strings.restoreWalletUsingSeed,
                    style: normal16Hint,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    style: normal16White,
                    minLines: 4,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: hintTextColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: hintTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: hintTextColor),
                      ),
                    ),
                    onChanged: (input) {
                      controller.setMnemonic(input);
                      if (input.split(' ').length == 12) {
                        setState(() {
                          isValidSeedPhrase = true;
                        });
                      } else {
                        if (isValidSeedPhrase) {
                          setState(() {
                            isValidSeedPhrase = false;
                          });
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Observer(
                  builder: (context) =>
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: PaperValidationSummary(controller.errors),
                      ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: IgnorePointer(
                ignoring: !isValidSeedPhrase,
                child: Opacity(
                  opacity: isValidSeedPhrase ? 1 : 0.6,
                  child: GradientRaisedButton(
                    label: 'Restore',
                    onPressed: () async {
                      if (await controller.confirmMnemonic()) {
                        await WalletModule.toMainPage();
                      }
                    },
                    radius: 100,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
