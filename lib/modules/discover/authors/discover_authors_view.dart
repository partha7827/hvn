import 'dart:async';

import 'package:built_collection/src/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/discover/authors/author_card.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';
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
    return Observer(
      builder: (_) {
        final authors = controller.authors.value;
        switch (controller.authors.status) {
          case FutureStatus.fulfilled:
            if (!audioLoaded) {
              audioLoaded = true;
              changeOpacity();
            }
            return _buildAuthors(authors);
          case FutureStatus.rejected:
            return RepeatWidget(controller.loadAuthors);
          default:
            return const SplashWidget();
        }
      },
    );
  }

  Widget _buildAuthors(BuiltList<User> authors) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: _opacity,
      child: ListView.builder(
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
      ),
    );
  }
}
