// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  final _$inProgressAtom = Atom(name: '_RegisterControllerBase.inProgress');

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

  final _$hasAcceptedTermsAtom =
      Atom(name: '_RegisterControllerBase.hasAcceptedTerms');

  @override
  bool get hasAcceptedTerms {
    _$hasAcceptedTermsAtom.context.enforceReadPolicy(_$hasAcceptedTermsAtom);
    _$hasAcceptedTermsAtom.reportObserved();
    return super.hasAcceptedTerms;
  }

  @override
  set hasAcceptedTerms(bool value) {
    _$hasAcceptedTermsAtom.context.conditionallyRunInAction(() {
      super.hasAcceptedTerms = value;
      _$hasAcceptedTermsAtom.reportChanged();
    }, _$hasAcceptedTermsAtom, name: '${_$hasAcceptedTermsAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$registerUserAsyncAction = AsyncAction('registerUser');

  @override
  Future<void> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  final _$resetPasswordAsyncAction = AsyncAction('resetPassword');

  @override
  Future<void> resetPassword(String email) {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword(email));
  }

  @override
  String toString() {
    final string =
        'inProgress: ${inProgress.toString()},hasAcceptedTerms: ${hasAcceptedTerms.toString()}';
    return '{$string}';
  }
}
