// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LiveController on _LiveControllerBase, Store {
  final _$currentCreatorAtom = Atom(name: '_LiveControllerBase.currentCreator');

  @override
  User get currentCreator {
    _$currentCreatorAtom.reportRead();
    return super.currentCreator;
  }

  @override
  set currentCreator(User value) {
    _$currentCreatorAtom.reportWrite(value, super.currentCreator, () {
      super.currentCreator = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_LiveControllerBase.init');

  @override
  Future<void> init(User user) {
    return _$initAsyncAction.run(() => super.init(user));
  }

  @override
  String toString() {
    return '''
currentCreator: ${currentCreator}
    ''';
  }
}