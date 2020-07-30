import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/home/widgets/audios_widget.dart';
import 'package:highvibe/modules/home/widgets/authors_widget.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';

class MobileHomeWidget extends StatelessWidget {
  final HomeController controller;

  const MobileHomeWidget({
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.dstATop,
            ),
            child: Image.asset('assets/home_background.jpg', fit: BoxFit.cover),
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
    );
  }

  Column _buildQuoteWidget() {
    return Column(
      children: <Widget>[
        SvgPicture.asset('assets/ic_quote.svg'),
        Padding(
          padding: const EdgeInsets.all(20),
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

  void _openDrawer() {
    controller.scaffoldKey.currentState.openDrawer();
  }
}
