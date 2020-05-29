import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final auth = Modular.get<AuthService>();
  final firestore = Modular.get<FirestoreService>();
  final appStore = Modular.get<AppController>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @observable
  bool inProgress = false;

  @observable
  bool hasAcceptedTerms = false;

  @action
  Future<void> registerUser() async {
    inProgress = true;

    final user = await auth.emailRegister(
      email: emailController.text,
      password: passwordController.text,
      name: usernameController.text,
    );

    await firestore.userCollection
        .document(user.id)
        .setData(serializers.serialize(user));

    appStore.setCurrentUser(user);

    inProgress = false;
  }
}
