import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/meditation/focus/screens/breathe_screen.dart';
import 'package:highvibe/modules/meditation/focus/screens/settings_screen.dart';
import 'package:highvibe/modules/meditation/meditation_controller.dart';
import 'package:highvibe/modules/meditation/meditation_page.dart';

class MeditationModule extends ChildModule {
  static Inject<MeditationModule> get to => Inject<MeditationModule>.of();

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => MeditationController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router('/settings', child: (_, args) => SettingsScreen()),
        Router('/breath', child: (_, args) => BreatheScreen()),
      ];

  static Future<Object> toBreathe() => Modular.to.pushNamed('/breath');
  static Future<Object> toSettings() => Modular.to.pushNamed('/settings');
}
