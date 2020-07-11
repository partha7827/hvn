import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/profile/current_user/edit_profile/edit_profile_controller.dart';
import 'package:highvibe/modules/profile/current_user/edit_profile/edit_profile_page.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/services/storage_service.dart';

class EditProfileModule extends WidgetModule {
  @override
  final List<Bind<Object>> binds = [
    Bind<EditProfileController>((_) => EditProfileController()),
    Bind<AppController>((_) => AppController()),
    Bind<AuthService>((_) => AuthService.withFirebase()),
    Bind<StorageService>((_) => StorageService.withFirebase()),
    Bind<FirestoreService>((_) => FirestoreService.withFirebase()),
  ];

  @override
  Widget get view => const EditProfilePage();
}
