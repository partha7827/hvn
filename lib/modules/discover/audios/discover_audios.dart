import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/discover/audios/discover_audios_controller.dart';
import 'package:highvibe/modules/discover/audios/discover_audios_view.dart';

class DiscoverAudios extends WidgetModule {

  DiscoverAudios(this.users);

  final BuiltList<User> users;
  
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => DiscoverAudiosController()),
  ];

  @override
  Widget get view => DiscoverAudiosView(users: users);
}
