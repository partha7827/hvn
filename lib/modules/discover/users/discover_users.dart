import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/discover/users/discover_users_view.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:highvibe/values/themes.dart';
import './discover_users_controller.dart';

final commonBinds = [
  Bind<AuthService>((_) => AuthService.withFirebase()),
  Bind<StoreService>((_) => StoreService.withFirebase()),
  Bind((_) => AppStore()),
];

class DiscoverUsers extends WidgetModule {
  @override
  List<Bind> get binds => [
        ...commonBinds,
        Bind((_) => DiscoverUsersController()),
      ];

  @override
  Widget get view => DiscoverUsersView();
}

class DiscoverFollowers extends WidgetModule {
  final List<String> userIds;
  DiscoverFollowers(this.userIds);

  @override
  Widget get view => Scaffold(
        appBar: _buildAppBar("Followers"),
        body: DiscoverUsersView(),
      );

  @override
  List<Bind> get binds => [
        ...commonBinds,
        Bind((_) => DiscoverUsersController(userIds: userIds)),
      ];
}

class DiscoverFollowing extends WidgetModule {
  final List<String> userIds;
  DiscoverFollowing(this.userIds);

  @override
  Widget get view => Scaffold(
        appBar: _buildAppBar("Following"),
        body: DiscoverUsersView(),
      );

  @override
  List<Bind> get binds => [
        ...commonBinds,
        Bind((_) => DiscoverUsersController(userIds: userIds)),
      ];
}

Widget _buildAppBar(String title) => AppBar(
      title: Text(
        title,
        style: bold20PlayfairWhite,
      ),
    );
