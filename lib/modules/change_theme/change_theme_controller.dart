import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'change_theme_controller.g.dart';

class ChangeThemeController = _ChangeThemeControllerBase
    with _$ChangeThemeController;

abstract class _ChangeThemeControllerBase with Store {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TabController tabController;
}
