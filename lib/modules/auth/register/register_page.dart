import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/auth/widgets/widgets.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/widgets.dart';
import 'package:universal_html/html.dart' as html;

import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = 'Register'}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: !isDisplayWebDesktop
          ? AppBar(
              title: Text(
                Strings.letsGetSignedUp,
                style: bold20PlayfairWhite,
              ),
            )
          : null,
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return isDisplayWebDesktop
              ? DesktopRegisterWidget(controller: controller)
              : MobileRegisterWidget(controller: controller);
        },
      ),
    );
  }

  @override
  void initState() {
    html.window.history.pushState(null, 'Register', '/register');
    super.initState();
  }
}
