import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/video_player/widgets/widgets.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/assets.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/page_indicator.dart';

class HeaderWidget extends StatelessWidget {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            Assets.homeBackground,
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                gradient: homeHeaderGradient,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                // leading: IconButton(
                //   icon: SvgPicture.asset('assets/ic_hamburger.svg'),
                //   onPressed: () {},
                // ),
                // actions: <Widget>[
                //   IconButton(
                //     icon: SvgPicture.asset('assets/ic_wallet.svg'),
                //     onPressed: () {
                //       Modular.to.pushNamed("/wallet");
                //     },
                //   ),
                //   IconButton(
                //     icon: SvgPicture.asset('assets/ic_notification.svg'),
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (_) => AudioPlayer()));
                //     },
                //   ),
                // ],
              ),
              _quote_widget(),
              _buildVideos(),
              // _recommended_widget(pageController),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVideos() {
    return FutureBuilder(
      future: Modular.get<HomeController>().getVideos(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: HeaderRow(
                    title: Strings.recommendedForYou,
                    showTrailing: true,
                  ),
                ),
                SizedBox(
                  height: 240,
                  child: PageView.builder(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return VideoPreviewItem(
                        video: snapshot.data[index],
                        onTap: (item) => presentVideoPlayerAsOverlay(
                          context,
                          item,
                        ),
                      );
                    },
                  ),
                ),
                PageIndicator(
                  controller: pageController,
                  count: snapshot.data.length,
                ),
              ],
            ),
          );
        } else {
          return Container(child: Text('No videos'));
        }
      },
    );
  }

  _quote_widget() {
    return Column(
      children: <Widget>[
        SvgPicture.asset('assets/ic_quote.svg'),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            Strings.defaultQuote,
            style: bold18PlayfairWhite,
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

  // _recommended_widget(PageController pageController) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 16.0),
  //     child: Column(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(left: 16.0),
  //           child: HeaderRow(
  //             title: Strings.recommendedForYou,
  //             showTrailing: true,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 220,
  //           child: PageView.builder(
  //             controller: pageController,
  //             itemCount: 4,
  //             itemBuilder: (context, index) => _recommended_card(context),
  //           ),
  //         ),
  //         PageIndicator(
  //           controller: pageController,
  //           count: 4,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // _recommended_card(BuildContext context) {
  //   return Column(
  //     children: <Widget>[
  //       ClipRRect(
  //         borderRadius: BorderRadius.circular(10),
  //         child: CachedNetworkImage(
  //           imageUrl:
  //               'https://images.unsplash.com/photo-1520199144204-310fca6d9fe0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  //           width: MediaQuery.of(context).size.width - 40,
  //           fit: BoxFit.cover,
  //           height: 180,
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text(
  //           'The Grand Plan to Rise and Shine',
  //           style: normal16White,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
