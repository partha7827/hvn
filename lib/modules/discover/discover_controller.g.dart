// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiscoverController on _DiscoverController, Store {
  final _$selectedTabAtom = Atom(name: '_DiscoverController.selectedTab');

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  final _$_DiscoverControllerActionController =
      ActionController(name: '_DiscoverController');

  @override
  void selectTab(int index) {
    final _$actionInfo = _$_DiscoverControllerActionController.startAction(
        name: '_DiscoverController.selectTab');
    try {
      return super.selectTab(index);
    } finally {
      _$_DiscoverControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadCreators() {
    final _$actionInfo = _$_DiscoverControllerActionController.startAction(
        name: '_DiscoverController.loadCreators');
    try {
      return super.loadCreators();
    } finally {
      _$_DiscoverControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTab: ${selectedTab}
    ''';
  }
}
