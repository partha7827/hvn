import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/change_theme/widgets/wallpaper.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/outline_tab_indicator.dart';

import 'change_theme_controller.dart';

class ChangeThemePage extends StatefulWidget {
  final int pageIndex;

  const ChangeThemePage({this.pageIndex = 0});

  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState
    extends ModularState<ChangeThemePage, ChangeThemeController>
    with SingleTickerProviderStateMixin {
  final _tabs = [
    Strings.wallpaper,
    Strings.sound,
  ];

  @override
  void initState() {
    controller.tabController = TabController(
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
        title: Text(Strings.theme, style: normalBold18White),
        bottom: TabBar(
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
          controller: controller.tabController,
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
      key: controller.scaffoldKey,
      body: TabBarView(
        controller: controller.tabController,
        children: [
          WallpaperList(),
          const SizedBox(),
        ],
      ),
    );
  }
}
