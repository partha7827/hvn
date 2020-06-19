import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'create_password_controller.g.dart';

class CreatePasswordController = _CreatePasswordControllerBase
    with _$CreatePasswordController;

abstract class _CreatePasswordControllerBase with Store {
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final AppController appStore = Modular.get<AppController>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @action
  Future<void> completeSignUp(BuildContext context, User incompleteUser) async {
    print('password = ${passwordController.text}');
  }

  Future<void> navigateToHome(User user) async {
    await firestore.userCollection
        .document(user.id)
        .setData(serializers.serialize(user));

    await appStore.setCurrentUser(user);
  }
}
