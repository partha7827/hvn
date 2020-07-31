import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'wallet_verify_seed_controller.g.dart';

class WalletVerifySeedController = _WalletVerifySeedControllerBase
    with _$WalletVerifySeedController;

abstract class _WalletVerifySeedControllerBase with Store {
  final AuthService auth = Modular.get<AuthService>();
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final AppController appStore = Modular.get<AppController>();

  final TextEditingController firstSeedController = TextEditingController();
  final TextEditingController secondSeedController = TextEditingController();
  final TextEditingController thirdSeedController = TextEditingController();

  int firstRandomNo;
  int secondRandomNo;
  int thirdRandomNo;

  void init() {
    final list = List<int>.generate(12, (int index) => index + 1);
    list.shuffle();
    firstRandomNo = list[0];
    secondRandomNo = list[1];
    thirdRandomNo = list[2];
  }

  @action
  Future<bool> verifySeed(List<String> mnemonics) async {
    final firstSeed = firstSeedController.text;
    final secondSeed = secondSeedController.text;
    final thirdSeed = thirdSeedController.text;

    if (firstSeed == mnemonics[firstRandomNo - 1] &&
        secondSeed == mnemonics[secondRandomNo - 1] &&
        thirdSeed == mnemonics[thirdRandomNo - 1]) {
      return true;
    }

    return false;
  }
}
