import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/discover/audios/discover_audios.dart';
import 'package:highvibe/modules/discover/authors/discover_authors.dart';
import 'package:highvibe/modules/discover/discover_controller.dart';
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
    Strings.discoverAudios,
    // Strings.discoverVideos,
    Strings.discoverAuthors,
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
        bottom: TabBar(
          controller: _tabController,
          indicator: const OutlineTabIndicator(
            gradient: primaryGradient,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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
          DiscoverAudios(),
          // DiscoverVideos(),
          DiscoverAuthors(),
        ],
      ),
    );
  }
}
