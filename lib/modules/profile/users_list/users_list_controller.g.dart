// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersListController on _UsersListControllerBase, Store {
  final _$usersAtom = Atom(name: '_UsersListControllerBase.users');

  @override
  ObservableFuture<BuiltList<User>> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableFuture<BuiltList<User>> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$_UsersListControllerBaseActionController =
      ActionController(name: '_UsersListControllerBase');

  @override
  void loadUsers() {
    final _$actionInfo = _$_UsersListControllerBaseActionController.startAction(
        name: '_UsersListControllerBase.loadUsers');
    try {
      return super.loadUsers();
    } finally {
      _$_UsersListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users}
    ''';
  }
}
