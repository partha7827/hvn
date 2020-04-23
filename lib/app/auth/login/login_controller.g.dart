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
    _$inProgressAtom.context.enforceReadPolicy(_$inProgressAtom);
    _$inProgressAtom.reportObserved();
    return super.inProgress;
  }

  @override
  set inProgress(bool value) {
    _$inProgressAtom.context.conditionallyRunInAction(() {
      super.inProgress = value;
      _$inProgressAtom.reportChanged();
    }, _$inProgressAtom, name: '${_$inProgressAtom.name}_set');
  }

  final _$loginUserAsyncAction = AsyncAction('loginUser');

  @override
  Future<void> loginUser() {
    return _$loginUserAsyncAction.run(() => super.loginUser());
  }

  final _$resetPasswordAsyncAction = AsyncAction('resetPassword');

  @override
  Future<void> resetPassword(String email) {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword(email));
  }

  @override
  String toString() {
    final string = 'inProgress: ${inProgress.toString()}';
    return '{$string}';
  }
}
