import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/values/themes.dart';
import 'package:mobx/mobx.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppController appStore = Modular.get<AppController>();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

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

    initConnectivity();
    _connectivitySubscription = appStore
        .connectivity.onConnectivityChanged
        .listen(appStore.updateConnectionStatus);

    reaction((_) => appStore.authState, (authState) {
      if (authState == AuthState.unauthenticated) {
        Modular.to.pushNamedAndRemoveUntil('/login', (_) => false);
      } else if (authState == AuthState.authenticated) {
        Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
      }
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await appStore.connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }
    return appStore.updateConnectionStatus(result);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
