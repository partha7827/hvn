import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/auth/login/login_page.dart';
import 'package:highvibe/app/home/home_page.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, AuthController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.authState) {
      case AuthState.initial:
        return SplashPage();
      case AuthState.authenticated:
        return HomePage();
      case AuthState.unauthenticated:
        return LoginPage();
      default:
        return SplashPage();
    }
  }
}
