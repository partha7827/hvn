// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_playlist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OpenPlaylistController on _OpenPlaylistControllerBase, Store {
  Computed<int> _$totalComputed;

  @override
  int get total => (_$totalComputed ??= Computed<int>(() => super.total,
          name: '_OpenPlaylistControllerBase.total'))
      .value;

  final _$amountAtom = Atom(name: '_OpenPlaylistControllerBase.amount');

  @override
  int get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(int value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$_OpenPlaylistControllerBaseActionController =
      ActionController(name: '_OpenPlaylistControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_OpenPlaylistControllerBaseActionController
        .startAction(name: '_OpenPlaylistControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_OpenPlaylistControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
amount: ${amount},
total: ${total}
    ''';
  }
}
