import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'lets_get_you_signed_up_contoller.g.dart';

class LetsGetYouSignedUpContoller = _LetsGetYouSignedUpContollerBase
    with _$LetsGetYouSignedUpContoller;

abstract class _LetsGetYouSignedUpContollerBase with Store {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  bool isUsernameAvailable = false;

  @action
  Future<void> toPasswordScreen(User incompleteUser) async {
    print('full name = ${fullNameController.text}');
    print('user name = ${userNameController.text}');

    final user = User(
      (b) => b
        ..name = fullNameController.text
        ..username = userNameController.text,
    );

    await AuthModule.toCreatePassword(user);
  }

  @action
  void checkUsername(User user) {
    if (formKey.currentState.validate()) {
      // Getting usernames
      firestore.userCollection
          .where('username', isEqualTo: userNameController.text.trim())
          .snapshots()
          .listen((event) {
        if (event.documents.isEmpty) {
          // Username available
          isUsernameAvailable = true;
          Timer(const Duration(seconds: 1), () {
            toPasswordScreen(user);
          });
        } else {
          // Username not available
          isUsernameAvailable = false;
        }
      });
    }
  }

  String suggestions() {
    //Return suggestions for username
    return '${userNameController.text}123, 123${userNameController.text}';
  }
}
