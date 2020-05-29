import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/discover/authors/discover_authors_controller.dart';
import 'package:highvibe/modules/discover/authors/discover_authors_view.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';

final commonBinds = [
  Bind<AuthService>((_) => AuthService.withFirebase()),
  Bind<FirestoreService>((_) => FirestoreService.withFirebase()),
  Bind((_) => AppController()),
];

class DiscoverAuthors extends WidgetModule {
  @override
  List<Bind> get binds => [
        ...commonBinds,
        Bind((_) => DiscoverAuthorsController()),
      ];

  @override
  Widget get view => DiscoverAuthorsView();
}