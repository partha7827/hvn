import 'dart:async';

import 'package:built_collection/src/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/discover/authors/author_card.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:shimmer/shimmer.dart';
import './discover_authors_controller.dart';

class DiscoverAuthorsView extends StatefulWidget {
  @override
  _DiscoverAuthorsViewState createState() => _DiscoverAuthorsViewState();
}

class _DiscoverAuthorsViewState
    extends ModularState<DiscoverAuthorsView, DiscoverAuthorsController>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  double _opacity = 0.0;
  Timer _timer;
  bool audioLoaded = false;

  @override
  void initState() {
    super.initState();
    controller.loadAuthors();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void changeOpacity() async {
    _timer = Timer(const Duration(milliseconds: 200), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return
        Observer(
      builder: (_) {
        final authors = controller.authors.value;
        switch (controller.authors.status) {
          case FutureStatus.fulfilled:
            return ListView.builder(
              itemCount: authors.length,
              itemBuilder: (_, index) {
                final user = authors[index];
                return Observer(
                  builder: (_) => AuthorCard(
                    user: user,
                    onChoose: () => ProfileModule.toOtherProfile(user),
                    onFollow: () => controller.followUser(user.id),
                    isFollowing: controller.isFollowing[user.id] == true,
                  ),
                );
              },
            );
          case FutureStatus.rejected:
            return RepeatWidget(controller.loadAuthors);
          default:
            return _shimmers();
        }
      },
    );
  }

  Widget _shimmers() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.only(bottom: 18, left: 4),
            child: Shimmer.fromColors(
              baseColor: Colors.white12,
              highlightColor: Colors.white38,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 8,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 14,
                          width: screenWidth(context) * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          height: 14,
                          width: screenWidth(context) * 0.2,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
