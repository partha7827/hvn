// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_authors_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiscoverAuthorsController on _DiscoverAuthorsController, Store {
  final _$authorsAtom = Atom(name: '_DiscoverAuthorsController.authors');

  @override
  ObservableFuture<BuiltList<User>> get authors {
    _$authorsAtom.reportRead();
    return super.authors;
  }

  @override
  set authors(ObservableFuture<BuiltList<User>> value) {
    _$authorsAtom.reportWrite(value, super.authors, () {
      super.authors = value;
    });
  }

  final _$numberOfFollowersAtom =
      Atom(name: '_DiscoverAuthorsController.numberOfFollowers');

  @override
  ObservableMap<String, int> get numberOfFollowers {
    _$numberOfFollowersAtom.reportRead();
    return super.numberOfFollowers;
  }

  @override
  set numberOfFollowers(ObservableMap<String, int> value) {
    _$numberOfFollowersAtom.reportWrite(value, super.numberOfFollowers, () {
      super.numberOfFollowers = value;
    });
  }

  final _$isFollowingAtom =
      Atom(name: '_DiscoverAuthorsController.isFollowing');

  @override
  ObservableMap<String, bool> get isFollowing {
    _$isFollowingAtom.reportRead();
    return super.isFollowing;
  }

  @override
  set isFollowing(ObservableMap<String, bool> value) {
    _$isFollowingAtom.reportWrite(value, super.isFollowing, () {
      super.isFollowing = value;
    });
  }

  final _$_DiscoverAuthorsControllerActionController =
      ActionController(name: '_DiscoverAuthorsController');

  @override
  void loadAuthors() {
    final _$actionInfo = _$_DiscoverAuthorsControllerActionController
        .startAction(name: '_DiscoverAuthorsController.loadAuthors');
    try {
      return super.loadAuthors();
    } finally {
      _$_DiscoverAuthorsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void followUser(String userId) {
    final _$actionInfo = _$_DiscoverAuthorsControllerActionController
        .startAction(name: '_DiscoverAuthorsController.followUser');
    try {
      return super.followUser(userId);
    } finally {
      _$_DiscoverAuthorsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authors: ${authors},
numberOfFollowers: ${numberOfFollowers},
isFollowing: ${isFollowing}
    ''';
  }
}
