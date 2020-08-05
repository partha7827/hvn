import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/mood_tracker/current_mood.dart';
import 'package:highvibe/modules/mood_tracker/mood_calendar_screen.dart';
import 'package:highvibe/modules/mood_tracker/mood_check_ins.dart';
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
        Router(
          '/currentMood',
          child: (_, args) => CurrentMood(
            title: args.data[0],
            image: args.data[1],
          ),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '/moodCheckIns',
          child: (_, args) => MoodCheckInsScreen(),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '/moodCalendar',
          child: (_, args) => MoodCalendarScreen(),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Future<Object> toCurrentMood(String title, String imagePath) =>
      Modular.to.pushNamed('/currentMood', arguments: [title, imagePath]);

  static Future<Object> toMoodCheckInScreen() => Modular.to.pushNamed(
        '/moodCheckIns',
      );

      static Future<Object> toMoodCalendarScreen() => Modular.to.pushNamed(
        '/moodCalendar',
      );
}
