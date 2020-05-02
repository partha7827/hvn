import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/values/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.black,
        navigatorKey: Modular.navigatorKey,
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
        theme: appTheme,
    );
  }
}
