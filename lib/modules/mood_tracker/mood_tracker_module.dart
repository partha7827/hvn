import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/mood_tracker/mood_tracker_controller.dart';
import 'package:highvibe/modules/mood_tracker/mood_tracker_page.dart';

class MoodTrackerModule extends ChildModule {
  @override
  List<Bind<Object>> get binds => [
        Bind((_) => MoodTrackerController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router(
          '/moodtracker',
          child: (_, args) => MoodTrackerPage(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
