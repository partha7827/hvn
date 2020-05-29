import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/user/user.dart';
import 'package:hvn/modules/profile/profile_module.dart';
import 'package:hvn/modules/profile/users_list/user_card.dart';
import 'package:hvn/modules/profile/users_list/users_list_controller.dart';
import 'package:hvn/widgets/repeat_widget.dart';
import 'package:hvn/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

class UsersListPage extends StatefulWidget {
  final String title;
  UsersListPage({this.title});

  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState
    extends ModularState<UsersListPage, UsersListController> {
  @override
  void initState() {
    super.initState();
    controller.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          BackButton(
            onPressed: Modular.to.maybePop,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          switch (controller.users.status) {
            case FutureStatus.fulfilled:
              return buildUsers(controller.users.value.toList());
            case FutureStatus.rejected:
              return RepeatWidget(controller.loadUsers);
            default:
              return SplashWidget();
          }
        },
      ),
    );
  }

  Widget buildUsers(List<User> users) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return UserCard(
          users[index],
          onTap: () => ProfileModule.toOtherProfile(users[index]),
        );
      },
      itemCount: users.length,
    );
  }
}
