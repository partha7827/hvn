import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hvn/values/themes.dart';
import 'package:hvn/widgets/underline_gradient_indicator.dart';

class ProfileTabButtons extends StatelessWidget {
  final TabController controller;

  const ProfileTabButtons({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        color: primaryLightColor,
        tabBar: TabBar(
          controller: controller,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineGradientIndicator(
            gradient: primaryGradientHorizontal,
            insets: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
          tabs: [
            Tab(
              icon: Image.asset(controller.index == 0
                  ? 'assets/ic_audio_colored.png'
                  : 'assets/ic_audio.png'),
            ),
            Tab(icon: SvgPicture.asset('assets/ic_chat.svg')),
            Tab(icon: SvgPicture.asset('assets/ic_broadcasting.svg')),
          ],
        ),
      ),
    );
  }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({this.tabBar, this.color});

  final TabBar tabBar;
  final Color color;

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: tabBar,
      color: color,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

