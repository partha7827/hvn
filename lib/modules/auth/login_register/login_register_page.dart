import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/auth/login_register/login_register_controller.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState
    extends ModularState<LoginRegisterPage, LoginRegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundImage(),
          _gradientOverlay(),
          _buildQuoteWidget(),
          _bottomButtons(context),
        ],
      ),
    );
  }

  Image _backgroundImage() => Image.asset('assets/ic_mountains.png');

  Container _gradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: homeHeaderGradient,
      ),
      alignment: Alignment.center,
    );
  }

  Positioned _bottomButtons(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: Container(
        width: screenWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: screenWidth(context) * 0.8,
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: GradientRaisedButton(
                label: 'I’m a new user',
                radius: 50,
                onPressed: controller.toRegister,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: GradientOutlineButton(
                radius: 40,
                label: Container(
                  width: screenWidth(context) * 0.8,
                  child: Text(
                    'I already have an account',
                    style: normal16Accent,
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: controller.toLogin,
              ),
            ),
            FlatButton(
              onPressed: controller.skipAndExplore,
              child: const Text(
                'Skip sign-up and explore',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF666CCC),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuoteWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('assets/ic_quote.svg'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              Strings.defaultQuote,
              style: bold20PlayfairWhite,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Henry James',
            style: normal14White,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
