import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/profile/widgets/profile_avatar.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/image_viewer.dart';

class ProfileWidget extends StatefulWidget {
  final String userName;
  final String userAvatar;
  final String userStatus;
  final String userBio;
  final Widget userFollowersWidget;
  final Widget userFollowingWidget;
  final Widget buttonWidget;
  final TabBar tabBar;
  final TabBarView tabView;

  ProfileWidget({
    @required this.userName,
    @required this.userAvatar,
    @required this.userStatus,
    @required this.buttonWidget,
    @required this.userBio,
    @required this.userFollowersWidget,
    @required this.userFollowingWidget,
    @required this.tabBar,
    @required this.tabView,
  });

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  double top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            expandedHeight: 750,
            floating: false,
            pinned: true,
            backgroundColor: secondaryColor,
            leading: const BackButton(
              onPressed: ProfileModule.toHome,
            ),
            flexibleSpace: LayoutBuilder(builder: (_, constraints) {
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                title: Opacity(
                  opacity: top > 100 ? 0 : 1,
                  child: Text(
                    widget.userName,
                    style: bold20White,
                  ),
                ),
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // why need appbar here?
                      AppBar(
                        backgroundColor: Colors.transparent,
                        leading: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => ProfileModule.toAvatarPicture(
                              ImageViewerArguments(
                                heroTag: 'author#${widget.userAvatar}',
                                imageUrl: widget.userAvatar,
                              ),
                            ),
                            child: Hero(
                              tag: 'author#${widget.userAvatar}',
                              child: ProfileAvatar(widget.userAvatar),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.userName,
                                  style: bold20White,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    widget.userStatus,
                                    style: normal16Hint,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: widget.buttonWidget,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          widget.userBio,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: normal16Hint,
                        ),
                      ),
                      tokenWidgets(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          widget.userFollowersWidget,
                          widget.userFollowingWidget,
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              color: primaryLightColor,
              tabBar: widget.tabBar,
            ),
          ),
        ],
        body: widget.tabView,
      ),
    );
  }

  Widget tokenWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.swag,
          style: bold16White,
        ),
        _badges(),
        _userPoints(),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _profileStatsWidget('87', Strings.hvnEarned),
                  _profileStatsWidget('2', Strings.sessionCount),
                  _profileStatsWidget('9', Strings.currentStreak),
                  _profileStatsWidget('4', Strings.questCompletion),
                ],
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: GradientOutlineButton(
              label: Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  Strings.shareYourStats,
                  style: normal16Accent,
                ),
              ),
              icon: SvgPicture.asset(
                'assets/ic_share.svg',
                color: accentColor,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _userPoints() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryLightColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _tokenWidget('assets/ic_karma.png', '245', Strings.karma),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            width: 1,
            color: hintTextColor,
          ),
          _tokenWidget('assets/ic_experience_points.png', '658',
              Strings.experiencePoint),
        ],
      ),
    );
  }

  Widget _badges() {
    final badgePathList = [
      'assets/ic_badge_one.png',
      'assets/ic_badge_two.png'
    ];
    return Container(
      height: 80,
      padding: const EdgeInsets.only(top: 30),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 60,
            height: 60,
            child: Image.asset(badgePathList[index]),
          );
        },
      ),
    );
  }

  Widget _tokenWidget(String path, String title, String subTitle) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(path),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? '', style: bold24White),
                Text(subTitle ?? '', style: normal10Hint),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileStatsWidget(String value, String label) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              value ?? '',
              style: bold24White,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                label ?? '',
                textAlign: TextAlign.center,
                style: normal14Hint,
                overflow: TextOverflow.fade,
              ),
            ),
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
