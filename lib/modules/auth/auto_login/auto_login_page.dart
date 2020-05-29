import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/modules/auth/auto_login/auto_login_controller.dart';
import 'package:hvn/widgets/splash_widget.dart';

class AutoLoginPage extends StatefulWidget {
  final String title;
  const AutoLoginPage({Key key, this.title = "AutoLogin"}) : super(key: key);

  @override
  _AutoLoginPageState createState() => _AutoLoginPageState();
}

class _AutoLoginPageState extends ModularState<AutoLoginPage, AutoLoginController> {
  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashWidget(),
    );
  }
}
