import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'achievements_controller.dart';
import 'achievements_page.dart';

class AchievementsModule extends WidgetModule {
  final User user;
  AchievementsModule(this.user);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => AchievementsController(user)),
      ];

  @override
  Widget get view => const AchievementsPage();
}
