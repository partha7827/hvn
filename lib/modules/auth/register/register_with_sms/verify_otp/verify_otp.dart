import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_rounded_button.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/verify_otp/verify_otp_controller.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({
    this.phoneNumber = '',
    this.countryCode = '',
  });

  final String phoneNumber;
  final String countryCode;

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState
    extends ModularState<VerifyOtpPage, VerifyOtpController> {
  String input = '';

  @override
  void initState() {
    controller.registerUser(widget.phoneNumber, widget.countryCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 60,
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '''Enter the Verification Code received on the ${widget.countryCode}-${widget.phoneNumber}''',
                  style: normal16Hint,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 60,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _inputCell(input: input.isNotEmpty ? input[0] : ''),
                    _inputCell(input: input.length > 1 ? input[1] : ''),
                    _inputCell(input: input.length > 2 ? input[2] : ''),
                    _inputCell(input: input.length > 3 ? input[3] : ''),
                    _inputCell(input: input.length > 4 ? input[4] : ''),
                    _inputCell(input: input.length > 5 ? input[5] : ''),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    Strings.resend,
                    style: TextStyle(
                      color: accentColor.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GradientRoundedRaisedButton(
                  onPressed: () => controller.onFormSubmitted(input),
                  label: Strings.continueText,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 2.2,
                  shrinkWrap: true,
                  children: <Widget>[
                    _keyboardButton('1'),
                    _keyboardButton('2'),
                    _keyboardButton('3'),
                    _keyboardButton('4'),
                    _keyboardButton('5'),
                    _keyboardButton('6'),
                    _keyboardButton('7'),
                    _keyboardButton('8'),
                    _keyboardButton('9'),
                    _keyboardButton('.'),
                    _keyboardButton('0'),
                    InkWell(
                      onTap: backspace,
                      child: Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset('assets/ic_delete.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleKeyPress(String key) {
    if (key == '.') {
      // Decimal point
    } else if (input.length < 6) {
      setState(() {
        input += key;
      });
    }
  }

  void backspace() {
    if (input.isNotEmpty) {
      setState(() {
        input = input.substring(0, input.length - 1);
      });
    }
  }

  InkWell _keyboardButton(String key) {
    return InkWell(
      onTap: () => _handleKeyPress(key),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '$key',
          style: normal25White,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Container _inputCell({String input = ''}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color:
              input.isEmpty ? const Color(0xFF525366) : const Color(0xFF39C16C),
        ),
      ),
      width: 36,
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Text(
        '$input',
        style: normal16White,
        textAlign: TextAlign.center,
      ),
    );
  }
}
