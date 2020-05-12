// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExploreController on _ExploreControllerBase, Store {
  final _$filesReadyAtom = Atom(name: '_ExploreControllerBase.filesReady');

  @override
  bool get filesReady {
    _$filesReadyAtom.context.enforceReadPolicy(_$filesReadyAtom);
    _$filesReadyAtom.reportObserved();
    return super.filesReady;
  }

  @override
  set filesReady(bool value) {
    _$filesReadyAtom.context.conditionallyRunInAction(() {
      super.filesReady = value;
      _$filesReadyAtom.reportChanged();
    }, _$filesReadyAtom, name: '${_$filesReadyAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'filesReady: ${filesReady.toString()}';
    return '{$string}';
  }
}
