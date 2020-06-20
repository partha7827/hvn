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
      (_$isFollowingComputed ??= Computed<bool>(() => super.isFollowing,
              name: '_OtherUserControllerBase.isFollowing'))
          .value;

  final _$otherUserAtom = Atom(name: '_OtherUserControllerBase.otherUser');

  @override
  User get otherUser {
    _$otherUserAtom.reportRead();
    return super.otherUser;
  }

  @override
  set otherUser(User value) {
    _$otherUserAtom.reportWrite(value, super.otherUser, () {
      super.otherUser = value;
    });
  }

  final _$followersAtom = Atom(name: '_OtherUserControllerBase.followers');

  @override
  ObservableList<String> get followers {
    _$followersAtom.reportRead();
    return super.followers;
  }

  @override
  set followers(ObservableList<String> value) {
    _$followersAtom.reportWrite(value, super.followers, () {
      super.followers = value;
    });
  }

  final _$followingAtom = Atom(name: '_OtherUserControllerBase.following');

  @override
  ObservableList<String> get following {
    _$followingAtom.reportRead();
    return super.following;
  }

  @override
  set following(ObservableList<String> value) {
    _$followingAtom.reportWrite(value, super.following, () {
      super.following = value;
    });
  }

  final _$followUserAsyncAction =
      AsyncAction('_OtherUserControllerBase.followUser');

  @override
  Future<void> followUser() {
    return _$followUserAsyncAction.run(() => super.followUser());
  }

  @override
  String toString() {
    return '''
otherUser: ${otherUser},
followers: ${followers},
following: ${following},
isFollowing: ${isFollowing}
    ''';
  }
}
