import 'package:flutter/material.dart';
import 'package:highvibe/models/fab_icon/fab_icon_model.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/profile/widgets/fab_with_icons.dart';
import 'package:highvibe/modules/profile/widgets/profile_avatar.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/image_viewer.dart';

class ProfileWidget extends StatefulWidget {
  final String name;
  final String userAvatar;
  final String userStatus;
  final String userBio;
  final Widget userFollowersWidget;
  final Widget userFollowingWidget;
  final Widget buttonWidget;
  final TabBar tabBar;
  final TabBarView tabView;
  final String username;
  final String userId;

  const ProfileWidget({
    @required this.name,
    @required this.userAvatar,
    @required this.userStatus,
    @required this.buttonWidget,
    @required this.userBio,
    @required this.userFollowersWidget,
    @required this.userFollowingWidget,
    @required this.tabBar,
    @required this.tabView,
    @required this.userId,
    this.username = '',
  });

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  double top = 0.0;
  // bool isFabClicked = false;

  final List<FabIconModel> fabicons = [
    FabIconModel(
        title: Strings.uploadContent, imagePath: 'assets/ic_upload.svg'),
    FabIconModel(title: Strings.goLive, imagePath: 'assets/ic_go_live.svg'),
    FabIconModel(
        title: Strings.createPlaylist,
        imagePath: 'assets/ic_create_playlist.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            expandedHeight: 320,
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
                    widget.name,
                    style: bold20White,
                  ),
                ),
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                                  widget.name,
                                  style: bold20White,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    widget.userStatus,
                                    style: normal16Hint,
                                  ),
                                ),
                                Visibility(
                                  visible: widget.username.isNotEmpty,
                                  child: FlatButton(
                                    onPressed: () {
                                      createProfileLink(widget.userId);
                                    },
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      '@${widget.username}',
                                      style: normal16Accent,
                                    ),
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
      floatingActionButton: FabWithIcons(
        icons: fabicons,
        onIconTapped: (iconIndex) {
          switch (iconIndex) {
            case 2:
              PlaylistModule.toCreateNewPlaylist();
              break;
            default:
              break;
          }
        },
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
