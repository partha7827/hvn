// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  final _$clientAtom = Atom(name: '_ChatControllerBase.client');

  @override
  Chat.Client get client {
    _$clientAtom.context.enforceReadPolicy(_$clientAtom);
    _$clientAtom.reportObserved();
    return super.client;
  }

  @override
  set client(Chat.Client value) {
    _$clientAtom.context.conditionallyRunInAction(() {
      super.client = value;
      _$clientAtom.reportChanged();
    }, _$clientAtom, name: '${_$clientAtom.name}_set');
  }

  final _$channelAtom = Atom(name: '_ChatControllerBase.channel');

  @override
  Chat.Channel get channel {
    _$channelAtom.context.enforceReadPolicy(_$channelAtom);
    _$channelAtom.reportObserved();
    return super.channel;
  }

  @override
  set channel(Chat.Channel value) {
    _$channelAtom.context.conditionallyRunInAction(() {
      super.channel = value;
      _$channelAtom.reportChanged();
    }, _$channelAtom, name: '${_$channelAtom.name}_set');
  }

  final _$currentCreatorAtom = Atom(name: '_ChatControllerBase.currentCreator');

  @override
  User get currentCreator {
    _$currentCreatorAtom.context.enforceReadPolicy(_$currentCreatorAtom);
    _$currentCreatorAtom.reportObserved();
    return super.currentCreator;
  }

  @override
  set currentCreator(User value) {
    _$currentCreatorAtom.context.conditionallyRunInAction(() {
      super.currentCreator = value;
      _$currentCreatorAtom.reportChanged();
    }, _$currentCreatorAtom, name: '${_$currentCreatorAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init(User user) {
    return _$initAsyncAction.run(() => super.init(user));
  }

  @override
  String toString() {
    final string =
        'client: ${client.toString()},channel: ${channel.toString()},currentCreator: ${currentCreator.toString()}';
    return '{$string}';
  }
}
