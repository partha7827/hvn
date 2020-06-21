import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/journal/journal_controller.dart';
import 'package:highvibe/modules/journal/journal_page.dart';

class JournalModule extends ChildModule {
  @override
  List<Bind<Object>> get binds => [
    Bind((_) => JournalController()),
  ];

  @override
  List<Router<Object>> get routers => [
    Router(
      '/journal',
      child: (_, args) => JournalPage(),
      transition: TransitionType.fadeIn,
    ),
  ];

  static Future<Object> toJournal() => Modular.to.pushNamed('/journal');
}