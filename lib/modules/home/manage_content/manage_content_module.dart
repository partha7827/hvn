import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/manage_content/desktop_manage_content_page.dart';
import 'package:highvibe/modules/home/manage_content/manage_content_contoller.dart';
import 'package:highvibe/services/storage_service.dart';

class ManageContentModule extends WidgetModule {
  ManageContentModule();

  @override
  List<Bind<Object>> get binds => [
        Bind<StorageService>((_) => StorageService.withFirebase()),
        Bind<ManageContentController>((i) => ManageContentController()),
      ];

  @override
  Widget get view {
    return const DesktopManageContentPage();
  }
}
