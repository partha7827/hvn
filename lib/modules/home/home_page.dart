import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/home/widgets/drawer_widget.dart';
import 'package:highvibe/modules/home/widgets/exit_app.dart';
import 'package:highvibe/modules/home/widgets/widgets.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/widgets/widgets.dart' show ResponsiveSafeArea;
import 'package:highvibe/widgets/widgets.dart';
import 'package:universal_html/html.dart' as html;

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        key: controller.scaffoldKey,
        drawer: DrawerWidget(),
        body: ResponsiveSafeArea(
          builder: (context, size) {
            return isDisplayWebDesktop
                ? DesktopHomeWidget(controller: controller)
                : MobileHomeWidget(controller: controller);
          },
        ),
      ),
    );
  }

  Future<bool> _willPop() async {
    final shouldPop = await onWillPop();
    if (shouldPop) {
      final shouldExit = await showExitDialog(context);
      if (shouldExit) {
        if (MediaOverlays.audioKey?.currentState?.controller?.player != null) {
          MediaOverlays.disposeAudioOverlayEntry();
        }
      }
      return shouldExit;
    }
    return shouldPop;
  }

  @override
  void initState() {
    super.initState();
    html.window.history.pushState(null, 'Home', '/home');
  }
}
