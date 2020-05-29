import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/serializer/serializer.dart';
import 'package:hvn/modules/app/app_store.dart';
import 'package:hvn/services/auth_service.dart';
import 'package:hvn/services/store_service.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final auth = Modular.get<AuthService>();
  final firestore = Modular.get<StoreService>();
  final appStore = Modular.get<AppStore>();

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
