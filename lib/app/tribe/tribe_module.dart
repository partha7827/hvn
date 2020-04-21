import 'package:highvibe/app/chat/chat_controller.dart';
import 'package:highvibe/app/donations/donations_controller.dart';
import 'package:highvibe/app/live/live_controller.dart';
import 'package:highvibe/app/profile/profile_controller.dart';
import 'package:highvibe/app/tribe/tribe_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/tribe/tribe_page.dart';

class TribeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TribeController()),
        Bind((i) => DonationsController()),
        Bind((i) => ChatController()),
        Bind((i) => LiveController()),
        Bind((i) => ProfileController())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TribePage()),
      ];

  static Inject get to => Inject<TribeModule>.of();
}
