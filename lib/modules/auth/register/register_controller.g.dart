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
    _$inProgressAtom.reportRead();
    return super.inProgress;
  }

  @override
  set inProgress(bool value) {
    _$inProgressAtom.reportWrite(value, super.inProgress, () {
      super.inProgress = value;
    });
  }

  final _$hasAcceptedTermsAtom =
      Atom(name: '_RegisterControllerBase.hasAcceptedTerms');

  @override
  bool get hasAcceptedTerms {
    _$hasAcceptedTermsAtom.reportRead();
    return super.hasAcceptedTerms;
  }

  @override
  set hasAcceptedTerms(bool value) {
    _$hasAcceptedTermsAtom.reportWrite(value, super.hasAcceptedTerms, () {
      super.hasAcceptedTerms = value;
    });
  }

  final _$registerUserAsyncAction =
      AsyncAction('_RegisterControllerBase.registerUser');

  @override
  Future<void> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  @override
  String toString() {
    return '''
inProgress: ${inProgress},
hasAcceptedTerms: ${hasAcceptedTerms}
    ''';
  }
}
