import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/auth/auto_login/auto_login_controller.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:lottie/lottie.dart';

class AutoLoginPage extends StatefulWidget {
  final String title;
  const AutoLoginPage({Key key, this.title = 'AutoLogin'}) : super(key: key);

  @override
  _AutoLoginPageState createState() => _AutoLoginPageState();
}

class _AutoLoginPageState
    extends ModularState<AutoLoginPage, AutoLoginController>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..value = 0
      ..duration = const Duration(seconds: 3);
      
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });

    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundImage(context),
          _animatedLogo(),
        ],
      ),
    );
  }

  Container _animatedLogo() {
    return Container(
      child: Center(
        child: SizedBox(
          height: 133,
          width: 281,
          child: Lottie.asset(
            'assets/animation/logo_animation.json',
            controller: _controller,
            // onLoaded: (LottieComposition composition) {
            //   setState(() {
            //     _controller.duration = composition.duration;
            //   });
            // },
          ),
        ),
      ),
    );
  }

  Container _backgroundImage(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context),
      child: Image.asset(
        'assets/ic_splash_background.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
