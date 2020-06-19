import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:mobx/mobx.dart';

part 'lets_get_you_signed_up_contoller.g.dart';

class LetsGetYouSignedUpContoller = _LetsGetYouSignedUpContollerBase
    with _$LetsGetYouSignedUpContoller;

abstract class _LetsGetYouSignedUpContollerBase with Store {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @action
  Future<void> toPasswordScreen(User incompleteUser) async {
    print('full name = ${fullNameController.text}');
    print('user name = ${userNameController.text}');

    final user = User(
      (b) => b..name = fullNameController.text,
    );

    await AuthModule.toCreatePassword(user);
  }
}
