// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievements_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AchievementsController on _AchievementsControllerBase, Store {
  Computed<String> _$somethingComputed;

  @override
  String get something =>
      (_$somethingComputed ??= Computed<String>(() => super.something,
              name: '_AchievementsControllerBase.something'))
          .value;

  final _$_AchievementsControllerBaseActionController =
      ActionController(name: '_AchievementsControllerBase');

  @override
  void share() {
    final _$actionInfo = _$_AchievementsControllerBaseActionController
        .startAction(name: '_AchievementsControllerBase.share');
    try {
      return super.share();
    } finally {
      _$_AchievementsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
something: ${something}
    ''';
  }
}
