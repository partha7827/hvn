// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_audios_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiscoverAudiosController on _DiscoverAudiosControllerBase, Store {
  final _$audiosAtom = Atom(name: '_DiscoverAudiosControllerBase.audios');

  @override
  ObservableFuture<BuiltList<Audio>> get audios {
    _$audiosAtom.reportRead();
    return super.audios;
  }

  @override
  set audios(ObservableFuture<BuiltList<Audio>> value) {
    _$audiosAtom.reportWrite(value, super.audios, () {
      super.audios = value;
    });
  }

  final _$_DiscoverAudiosControllerBaseActionController =
      ActionController(name: '_DiscoverAudiosControllerBase');

  @override
  void loadAudios() {
    final _$actionInfo = _$_DiscoverAudiosControllerBaseActionController
        .startAction(name: '_DiscoverAudiosControllerBase.loadAudios');
    try {
      return super.loadAudios();
    } finally {
      _$_DiscoverAudiosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
audios: ${audios}
    ''';
  }
}
