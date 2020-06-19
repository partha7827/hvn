import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/change_theme/change_theme_controller.dart';
import 'package:highvibe/modules/change_theme/change_theme_page.dart';

class ChangeThemeModule extends ChildModule {
  @override
  List<Bind<Object>> get binds => [
        Bind((_) => ChangeThemeController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router(
          '/changeTheme',
          child: (_, args) => const ChangeThemePage(),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Future<Object> toChangeTheme() =>
      Modular.to.pushNamed('/changeTheme');
}
