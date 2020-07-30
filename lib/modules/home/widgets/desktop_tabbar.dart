import 'package:flutter/material.dart';

class DesktopTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController tabController;

  const DesktopTabBar({
    Key key,
    this.tabs,
    this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusTraversalOrder(
      order: const NumericFocusOrder(0),
      child: TabBar(
        isScrollable: true,
        labelPadding: EdgeInsets.zero,
        tabs: tabs,
        controller: tabController,
        indicatorColor: const Color(0xFF66CCC),
      ),
    );
  }
}
