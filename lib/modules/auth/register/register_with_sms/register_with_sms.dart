import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/register_with_sms_controller.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/gradient_rounded_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterWithSms extends StatefulWidget {
  @override
  _RegisterWithSmsState createState() => _RegisterWithSmsState();
}

class _RegisterWithSmsState
    extends ModularState<RegisterWithSms, RegisterWithSmsController> {
  bool invalidPhoneNumber = false;
  String countryCode = '+1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            width: screenWidth(context),
            height: screenHeight(context),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _bodyWidget(context),
                  _bottomRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _bottomRow() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Strings.dontHaveAccount,
            style: normal16White,
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: Text(
              Strings.logSpaceIn,
              style: normal16Accent,
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          _logo(),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              Strings.letsGetSignedUp,
              style: bold24PlayfairWhite,
            ),
          ),
          _textInputWidget(),
          _orViaEmail(),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: GradientRoundedRaisedButton(
              label: Strings.getStarted,
              onPressed: () {
                if (controller.phoneNumberController.text.isNotEmpty &&
                    controller.phoneNumberController.text.length == 10) {
                  FocusScope.of(context).unfocus();
                  AuthModule.toVerifyOtp(
                    [controller.phoneNumberController.text, countryCode],
                  );
                } else {
                  setState(() {
                    invalidPhoneNumber = true;
                  });
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Text(
              Strings.orSignupWithSocialAccount,
              style: normal16White,
            ),
          ),
          _socialMediaButtons(),
        ],
      ),
    );
  }

  Container _socialMediaButtons() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _appleSignIn(),
          const SizedBox(
            width: 40,
          ),
          _facebookSignIn(),
          const SizedBox(
            width: 40,
          ),
          _googleSignIn(),
        ],
      ),
    );
  }

  Observer _googleSignIn() {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: GradientOutlineButton(
          isLoading: controller.inProgressGoogleSignIn,
          icon: SvgPicture.asset('assets/ic_google.svg'),
          onPressed: () async {
            try {
              await controller.googleSignIn();
            } catch (e) {
              showSnackBarMsg(
                  controller.scaffoldKey.currentState, e.toString());
            }
          },
        ),
      ),
    );
  }

  Observer _facebookSignIn() {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: GradientOutlineButton(
          isLoading: controller.inProgressFacebookLogIn,
          icon: SvgPicture.asset('assets/ic_facebook.svg'),
          onPressed: () async {
            try {
              await controller.facebookLogin();
            } catch (e) {
              showSnackBarMsg(
                  controller.scaffoldKey.currentState, e.toString());
            }
          },
        ),
      ),
    );
  }

  Padding _appleSignIn() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GradientOutlineButton(
        icon: SvgPicture.asset('assets/ic_apple.svg'),
        onPressed: () {},
      ),
    );
  }

  Container _orViaEmail() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
        bottom: 50,
      ),
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          Strings.orViaEmail,
          style: normal16Accent,
        ),
      ),
    );
  }

  Widget _textInputWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: invalidPhoneNumber
                  ? Colors.red
                  : Colors.white.withOpacity(0.5),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  gradient: primaryGradient,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: primaryColor,
                  ),
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    '+1',
                    style: normal16White,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: TextFormField(
                    controller: controller.phoneNumberController,
                    style: normal16White,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 20,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: invalidPhoneNumber,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              top: 8,
            ),
            child: Text(
              Strings.invalidPhoneNumber,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _logo() {
    return Container(
      margin: const EdgeInsets.only(
        top: 100,
        bottom: 40,
      ),
      height: 80,
      width: 80,
      child: Image.asset(
        'assets/ic_hvn_logo.png',
      ),
    );
  }
}
