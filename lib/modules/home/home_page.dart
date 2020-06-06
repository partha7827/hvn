import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/home/widgets/audios_widget.dart';
import 'package:highvibe/modules/home/widgets/authors_widget.dart';
import 'package:highvibe/modules/home/widgets/exit_app.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/playlists_card.dart';

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
                    child: _buildQuoteWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 40),
                    child: _playlist(),
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
            )
          ],
        ),
      ),
    );
  }

  Widget _playlist() {
    return const PlaylistsCard(
      playlistLength: 5,
      title: 'My Play List',
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
    final shouldExit = await showExitDialog(context);
    return shouldExit;
  }
}
