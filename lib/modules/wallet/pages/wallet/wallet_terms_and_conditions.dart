import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/wallet_module.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class WalletTermsAndConditions extends StatefulWidget {
  @override
  _WalletTermsAndConditionsState createState() =>
      _WalletTermsAndConditionsState();
}

class _WalletTermsAndConditionsState extends State<WalletTermsAndConditions> {
  bool checkBoxFunds = false,
      checkBoxApp = false,
      checkBoxTermsAndConditions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
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
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Text(
                    "Almost done! Let's review.",
                    style: bold24PlayfairWhite,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Text(
                    Strings.hvTermsAndConditions,
                    style: normal18Hint,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Checkbox(
                          value: checkBoxFunds,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (isChecked) {
                            setState(() {
                              checkBoxFunds = isChecked;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(Strings.fundsTermsAndConditions,
                              style: normal14White),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Checkbox(
                          value: checkBoxApp,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (isChecked) {
                            setState(() {
                              checkBoxApp = isChecked;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(Strings.seedPhraseTermsAndConditions,
                              style: normal14White),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Checkbox(
                        value: checkBoxTermsAndConditions,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (isChecked) {
                          setState(() {
                            checkBoxTermsAndConditions = isChecked;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: const TextSpan(
                            text: 'I have read and accept the ',
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: purpleColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: GradientRaisedButton(
                    label: 'Confirm & Finish',
                    radius: 100,
                    onPressed: () {
                      if (checkBoxFunds &&
                          checkBoxApp &&
                          checkBoxTermsAndConditions) {
                        WalletModule.toMainPage();
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
