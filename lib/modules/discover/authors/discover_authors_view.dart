import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    extends ModularState<DiscoverAuthorsView, DiscoverAuthorsController> {
  @override
  void initState() {
    super.initState();
    controller.loadAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
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
          return SplashWidget();
      }
    });
  }
}
