import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/discover/audio/audio_list_page.dart';
import 'package:highvibe/modules/discover/creator/creator_list_page.dart';
import 'package:highvibe/modules/discover/discover_controller.dart';
import 'package:highvibe/modules/discover/live_now/live_list_page.dart';
import 'package:highvibe/modules/discover/video/video_list_page.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/outline_tab_indicator.dart';

class DiscoverPage extends StatefulWidget {
  final int pageIndex;
  const DiscoverPage({this.pageIndex = 0});

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends ModularState<DiscoverPage, DiscoverController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _tabs = [
    Strings.creator,
    Strings.liveNow,
    Strings.audio,
    Strings.video,
  ];

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: widget.pageIndex,
      length: _tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.discover,
          style: bold20PlayfairWhite,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicator: OutlineTabIndicator(
            gradient: primaryGradient,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
          tabs: _tabs.map((title) {
            return Container(
              height: 40,
              child: Center(
                child: Text(
                  title,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CreatorListPage(),
          LiveListPage(),
          AudioListPage(),
          VideoListPage(),
        ],
      ),
    );
  }
}
