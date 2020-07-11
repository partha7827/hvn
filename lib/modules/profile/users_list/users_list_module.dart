import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/profile/users_list/users_list_controller.dart';
import 'package:highvibe/modules/profile/users_list/users_list_page.dart';

class UsersListModule extends WidgetModule {
  final List<String> userIds;
  final String title;
  UsersListModule({this.userIds, this.title});

  @override
  List<Bind<Object>> get binds => [
        Bind((_) => UsersListController(userIds)),
      ];

  @override
  Widget get view => UsersListPage(title: title);
}
