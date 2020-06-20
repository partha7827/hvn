// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$inProgressAtom = Atom(name: '_LoginControllerBase.inProgress');

  @override
  bool get inProgress {
    _$inProgressAtom.reportRead();
    return super.inProgress;
  }

  @override
  set inProgress(bool value) {
    _$inProgressAtom.reportWrite(value, super.inProgress, () {
      super.inProgress = value;
    });
  }

  final _$inProgressGoogleSignInAtom =
      Atom(name: '_LoginControllerBase.inProgressGoogleSignIn');

  @override
  bool get inProgressGoogleSignIn {
    _$inProgressGoogleSignInAtom.reportRead();
    return super.inProgressGoogleSignIn;
  }

  @override
  set inProgressGoogleSignIn(bool value) {
    _$inProgressGoogleSignInAtom
        .reportWrite(value, super.inProgressGoogleSignIn, () {
      super.inProgressGoogleSignIn = value;
    });
  }

  final _$inProgressFacebookLogInAtom =
      Atom(name: '_LoginControllerBase.inProgressFacebookLogIn');

  @override
  bool get inProgressFacebookLogIn {
    _$inProgressFacebookLogInAtom.reportRead();
    return super.inProgressFacebookLogIn;
  }

  @override
  set inProgressFacebookLogIn(bool value) {
    _$inProgressFacebookLogInAtom
        .reportWrite(value, super.inProgressFacebookLogIn, () {
      super.inProgressFacebookLogIn = value;
    });
  }

  final _$loginUserAsyncAction = AsyncAction('_LoginControllerBase.loginUser');

  @override
  Future<void> loginUser() {
    return _$loginUserAsyncAction.run(() => super.loginUser());
  }

  final _$facebookLoginAsyncAction =
      AsyncAction('_LoginControllerBase.facebookLogin');

  @override
  Future<void> facebookLogin() {
    return _$facebookLoginAsyncAction.run(() => super.facebookLogin());
  }

  final _$googleSignInAsyncAction =
      AsyncAction('_LoginControllerBase.googleSignIn');

  @override
  Future<void> googleSignIn() {
    return _$googleSignInAsyncAction.run(() => super.googleSignIn());
  }

  final _$resetPasswordAsyncAction =
      AsyncAction('_LoginControllerBase.resetPassword');

  @override
  Future<void> resetPassword(String email) {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword(email));
  }

  @override
  String toString() {
    return '''
inProgress: ${inProgress},
inProgressGoogleSignIn: ${inProgressGoogleSignIn},
inProgressFacebookLogIn: ${inProgressFacebookLogIn}
    ''';
  }
}
