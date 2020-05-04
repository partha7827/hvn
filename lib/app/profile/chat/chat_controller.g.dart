// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  final _$clientAtom = Atom(name: '_ChatControllerBase.client');

  @override
  Client get client {
    _$clientAtom.context.enforceReadPolicy(_$clientAtom);
    _$clientAtom.reportObserved();
    return super.client;
  }

  @override
  set client(Client value) {
    _$clientAtom.context.conditionallyRunInAction(() {
      super.client = value;
      _$clientAtom.reportChanged();
    }, _$clientAtom, name: '${_$clientAtom.name}_set');
  }

  final _$channelAtom = Atom(name: '_ChatControllerBase.channel');

  @override
  Channel get channel {
    _$channelAtom.context.enforceReadPolicy(_$channelAtom);
    _$channelAtom.reportObserved();
    return super.channel;
  }

  @override
  set channel(Channel value) {
    _$channelAtom.context.conditionallyRunInAction(() {
      super.channel = value;
      _$channelAtom.reportChanged();
    }, _$channelAtom, name: '${_$channelAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    final string =
        'client: ${client.toString()},channel: ${channel.toString()}';
    return '{$string}';
  }
}
