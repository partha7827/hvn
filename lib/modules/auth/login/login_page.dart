import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/auth/widgets/widgets.dart';
import 'package:highvibe/widgets/widgets.dart';
import 'package:universal_html/html.dart' as html;

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({this.title = 'Login'});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return isDisplayWebDesktop
              ? DesktopLoginWidget(controller: controller)
              : MobileLoginWidget(controller: controller);
        },
      ),
    );
  }

  @override
  void initState() {
    html.window.history.pushState(null, 'Login', '/login');
    super.initState();
  }
}
