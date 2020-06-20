import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/home/widgets/audios_widget.dart';
import 'package:highvibe/modules/home/widgets/authors_widget.dart';
import 'package:highvibe/modules/home/widgets/drawer_widget.dart';
import 'package:highvibe/modules/home/widgets/exit_app.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  bool showQuote = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        showQuote = true;
      });
    });
  }

  void _openDrawer() {
    controller.scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        key: controller.scaffoldKey,
        drawer: DrawerWidget(),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
                child: Image.asset(
                  'assets/home_background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  gradient: homeHeaderGradient,
                ),
              ),
            ),
            SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 40),
                    child: AnimatedOpacity(
                      opacity: showQuote ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      child: _buildQuoteWidget(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: AudiosWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: AuthorsWidget(),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: Container(
                width: screenWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: _openDrawer,
                      icon: SvgPicture.asset('assets/ic_hamburger.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildQuoteWidget() {
    return Column(
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
}
