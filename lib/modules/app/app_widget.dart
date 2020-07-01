import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/app/app_module.dart';
import 'package:highvibe/values/themes.dart';
import 'package:mobx/mobx.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppController appStore = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      navigatorKey: Modular.navigatorKey,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      theme: appTheme,
    );
  }

  @override
  void initState() {
    super.initState();

    if (!AppModule.isDevMode) {
      reaction((_) => appStore.authState, (authState) {
        if (authState == AuthState.unauthenticated) {
          Modular.to.pushNamedAndRemoveUntil('/login', (_) => false);
        } else if (authState == AuthState.authenticated) {
          Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
        }
      });
    }

    reaction((_) => appStore.overlay, (overlay) {
      Overlay.of(appStore.overlayContext).insert(overlay);
    });
  }
}
