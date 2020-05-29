import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/modules/discover/components/user_card.dart';
import 'package:hvn/modules/profile/profile_module.dart';
import 'package:hvn/widgets/repeat_widget.dart';
import 'package:hvn/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';
import './discover_users_controller.dart';

class DiscoverUsersView extends StatefulWidget {
  @override
  _DiscoverUsersViewState createState() => _DiscoverUsersViewState();
}

class _DiscoverUsersViewState
    extends ModularState<DiscoverUsersView, DiscoverUsersController> {
  @override
  void initState() {
    super.initState();
    controller.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (controller.usersFuture.status) {
        case FutureStatus.fulfilled:
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (_, index) {
              final user = controller.users[index];
              return Observer(
                builder: (_) => UserCard(
                  user: user,
                  onChoose: () => ProfileModule.toOtherProfile(user),
                  onFollow: () => controller.followUser(user.id),
                  isFollowing: controller.isFollowing[user.id] == true,
                ),
              );
            },
          );
        case FutureStatus.rejected:
          return RepeatWidget(controller.loadUsers);
        default:
          return SplashWidget();
      }
    });
  }
}
