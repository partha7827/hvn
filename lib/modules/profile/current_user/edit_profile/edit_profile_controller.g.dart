// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProfileController on _EditProfileControllerBase, Store {
  final _$inProgressAtom = Atom(name: '_EditProfileControllerBase.inProgress');

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

  final _$photoUrlAtom = Atom(name: '_EditProfileControllerBase.photoUrl');

  @override
  String get photoUrl {
    _$photoUrlAtom.reportRead();
    return super.photoUrl;
  }

  @override
  set photoUrl(String value) {
    _$photoUrlAtom.reportWrite(value, super.photoUrl, () {
      super.photoUrl = value;
    });
  }

  final _$updateUserInfoAsyncAction =
      AsyncAction('_EditProfileControllerBase.updateUserInfo');

  @override
  Future<User> updateUserInfo() {
    return _$updateUserInfoAsyncAction.run(() => super.updateUserInfo());
  }

  final _$updateUserAvatarAsyncAction =
      AsyncAction('_EditProfileControllerBase.updateUserAvatar');

  @override
  Future<User> updateUserAvatar(File file) {
    return _$updateUserAvatarAsyncAction
        .run(() => super.updateUserAvatar(file));
  }

  final _$_EditProfileControllerBaseActionController =
      ActionController(name: '_EditProfileControllerBase');

  @override
  void init() {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.init');
    try {
      return super.init();
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inProgress: ${inProgress},
photoUrl: ${photoUrl}
    ''';
  }
}
