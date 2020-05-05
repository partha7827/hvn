// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OtherUserController on _OtherUserControllerBase, Store {
  Computed<bool> _$isFollowingComputed;

  @override
  bool get isFollowing =>
      (_$isFollowingComputed ??= Computed<bool>(() => super.isFollowing)).value;

  final _$otherUserIdAtom = Atom(name: '_OtherUserControllerBase.otherUserId');

  @override
  String get otherUserId {
    _$otherUserIdAtom.context.enforceReadPolicy(_$otherUserIdAtom);
    _$otherUserIdAtom.reportObserved();
    return super.otherUserId;
  }

  @override
  set otherUserId(String value) {
    _$otherUserIdAtom.context.conditionallyRunInAction(() {
      super.otherUserId = value;
      _$otherUserIdAtom.reportChanged();
    }, _$otherUserIdAtom, name: '${_$otherUserIdAtom.name}_set');
  }

  final _$otherUserAtom = Atom(name: '_OtherUserControllerBase.otherUser');

  @override
  User get otherUser {
    _$otherUserAtom.context.enforceReadPolicy(_$otherUserAtom);
    _$otherUserAtom.reportObserved();
    return super.otherUser;
  }

  @override
  set otherUser(User value) {
    _$otherUserAtom.context.conditionallyRunInAction(() {
      super.otherUser = value;
      _$otherUserAtom.reportChanged();
    }, _$otherUserAtom, name: '${_$otherUserAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init(String userId) {
    return _$initAsyncAction.run(() => super.init(userId));
  }

  final _$followUserAsyncAction = AsyncAction('followUser');

  @override
  Future<void> followUser(dynamic userId) {
    return _$followUserAsyncAction.run(() => super.followUser(userId));
  }

  @override
  String toString() {
    final string =
        'otherUserId: ${otherUserId.toString()},otherUser: ${otherUser.toString()},isFollowing: ${isFollowing.toString()}';
    return '{$string}';
  }
}
