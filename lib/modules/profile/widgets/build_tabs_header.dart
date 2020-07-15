import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/underline_gradient_indicator.dart';

TabBar buildTabsHeader(TabController tabController, Function selectTab) =>
    TabBar(
      controller: tabController,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      indicator: const UnderlineGradientIndicator(
        gradient: primaryGradientHorizontal,
        insets: EdgeInsets.symmetric(horizontal: 16),
      ),
      onTap: (value) => selectTab(),
      tabs: [
        Tab(
          icon: tabController.index == 0
              ? Image.asset(
                  'assets/ic_audio_colored.png',
                  height: 36,
                  width: 36,
                )
              : Image.asset(
                  'assets/ic_audio.png',
                  height: 36,
                  width: 36,
                ),
        ),
        Tab(
          icon: tabController.index == 1
              ? Image.asset(
                  'assets/ic_playlist_active.png',
                  height: 36,
                  width: 36,
                )
              : Image.asset(
                  'assets/ic_playlist_inactive.png',
                  height: 36,
                  width: 36,
                ),
        ),
        Tab(
          icon: tabController.index == 2
              ? Image.asset('assets/ic_stats_and_reward_active.png')
              : Image.asset('assets/ic_stats_and_reward_inactive.png'),
        ),
      ],
    );
