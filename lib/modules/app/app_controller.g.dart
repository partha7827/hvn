// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$authStateAtom = Atom(name: '_AppControllerBase.authState');

  @override
  AuthState get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(AuthState value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  final _$currentUserAtom = Atom(name: '_AppControllerBase.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$setCurrentUserAsyncAction =
      AsyncAction('_AppControllerBase.setCurrentUser');

  @override
  Future<void> setCurrentUser(User user) {
    return _$setCurrentUserAsyncAction.run(() => super.setCurrentUser(user));
  }

  @override
  String toString() {
    return '''
authState: ${authState},
currentUser: ${currentUser}
    ''';
  }
}
