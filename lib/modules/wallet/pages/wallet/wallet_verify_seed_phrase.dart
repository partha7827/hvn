import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/pages/wallet/wallet_terms_and_conditions.dart';
import 'package:highvibe/modules/wallet/pages/wallet/wallet_verify_seed_controller.dart';
import 'package:highvibe/modules/wallet/stores/wallet_create_store.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class WalletVerifySeedPhrase extends StatefulWidget {
  const WalletVerifySeedPhrase({
    @required this.mnemonics,
  });

  final List<String> mnemonics;
  @override
  _WalletVerifySeedPhraseState createState() => _WalletVerifySeedPhraseState();
}

class _WalletVerifySeedPhraseState
    extends ModularState<WalletVerifySeedPhrase, WalletVerifySeedController> {
  final _walletStore = Modular.get<WalletCreateStore>();
  @override
  void initState() {
    controller.init();
    super.initState();
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "Let's verify your recovery \nphrase",
                  style: bold24PlayfairWhite,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      _textInputWidget(
                          label: 'Word #${controller.firstRandomNo}',
                          controller: controller.firstSeedController),
                      const SizedBox(height: 32),
                      _textInputWidget(
                          label: 'Word #${controller.secondRandomNo}',
                          controller: controller.secondSeedController),
                      const SizedBox(height: 32),
                      _textInputWidget(
                        label: 'Word #${controller.thirdRandomNo}',
                        controller: controller.thirdSeedController,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GradientRaisedButton(
                  label: 'Verify',
                  onPressed: verifySeedPhrase,
                  radius: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void toTermsAndConditions() {
    Navigator.push(
      context,
      MaterialPageRoute<WalletTermsAndConditions>(
          builder: (context) => WalletTermsAndConditions()),
    );
  }

  void verifySeedPhrase() async {
    FocusScope.of(context).unfocus();
    if (await controller.verifySeed(widget.mnemonics)) {
      if (await _walletStore.confirmMnemonic()) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: const EdgeInsets.all(0),
              backgroundColor: Colors.grey,
              content: Container(
                width: screenWidth(context),
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  gradient: primaryGradient,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.only(
                          left: 32,
                          right: 49,
                          top: 12,
                        ),
                        child: Image.asset(
                          'assets/ic_clap.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Your HV Wallet is \nbacked up!',
                        style: bold24PlayfairWhite,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        Strings.savePhraseDescription,
                        style: normal18Hint,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                        ),
                        child: SizedBox(
                          width: 100,
                          child: GradientRaisedButton(
                            label: 'Got it',
                            radius: 100,
                            onPressed: () {
                              Modular.to.pop();
                              toTermsAndConditions();

                              // controller.navigateToHome(widget.user);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    }
  }

  Widget _textInputWidget(
      {String label = '', TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: normal14White),
        const SizedBox(height: 4),
        CustomTextForm(
          hint: 'Type $label',
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          validator: (str) {
            if (str.isEmpty) return 'Please enter word';
            return null;
          },
        ),
      ],
    );
  }
}
