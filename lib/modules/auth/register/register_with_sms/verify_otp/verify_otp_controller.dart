import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'verify_otp_controller.g.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class VerifyOtpController = _VerifyOtpControllerBase with _$VerifyOtpController;

abstract class _VerifyOtpControllerBase with Store {
  final AuthService auth = Modular.get<AuthService>();
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final AppController appStore = Modular.get<AppController>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Timer timer;

  String verificationId;

  @observable
  bool hasAcceptedTerms = false;

  @observable
  bool inProgress = false;

  @observable
  int seconds = 0;

  @action
  Future<void> registerUser(String phoneNumber, String countryCode) async {
    inProgress = true;

    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );

    inProgress = false;
  }

  Future<void> verificationCompleted(AuthCredential phoneAuthCredential) async {
    final authResult =
        await _firebaseAuth.signInWithCredential(phoneAuthCredential);

    if (authResult != null && authResult.user != null) {
      final firebaseUser = authResult?.user;

      if (firebaseUser != null) {
        final user = User(
          (b) => b
            ..id = firebaseUser.uid
            ..chatId = firebaseUser.uid
            ..liveId = firebaseUser.uid,
        );
        await AuthModule.toLetsGetYouSignedUp(user);
      } else {
        print('error while validating otp');
      }
    }
  }

  void verificationFailed(AuthException authException) {
    print('AUTHEXCEPTION: ${authException.toString()}');
  }

  void codeSent(String verificationID, [int forceResendingToken]) async {
    verificationId = verificationID;
  }

  void codeAutoRetrievalTimeout(String verificationID) {
    print('codeAutoRetrievalTimeout VERIFICATIONID: $verificationID');
  }

  void onFormSubmitted(String smsCode) async {
    print('onFormSubmitted VERIFICATIONID: $verificationId');

    final _authCredential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: smsCode);

    try {
      final authResult =
          await _firebaseAuth.signInWithCredential(_authCredential);

      final firebaseUser = authResult?.user;

      if (firebaseUser != null) {
        final user = User(
          (b) => b
            ..id = firebaseUser.uid
            ..chatId = firebaseUser.uid
            ..liveId = firebaseUser.uid,
        );
        await AuthModule.toLetsGetYouSignedUp(user);
      } else {
        print('error while validating otp');
      }
    } catch (e) {
      print('error ${e.toString()}');
    }
  }

  @action
  Future<void> startCountDown() async {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        seconds = 60 - timer.tick;
        if (timer.tick == 60) {
          timer.cancel();
          print('seconds = $seconds');
        }
      },
    );
  }
}
