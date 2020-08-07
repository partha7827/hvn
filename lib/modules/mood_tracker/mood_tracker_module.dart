import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/mood_tracker/current_mood.dart';
import 'package:highvibe/modules/mood_tracker/edit_mood.dart';
import 'package:highvibe/modules/mood_tracker/mood.dart';
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
            imagePath: args.data[1],
          ),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '/moodCheckIns',
          child: (_, args) => MoodCheckInsScreen(mood: args.data),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '/moodCalendar',
          child: (_, args) => MoodCalendarScreen(
            mood: args.data,
          ),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '/editMood',
          child: (_, args) => EditMoodScreen(
            mood: args.data,
          ),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Future<Object> toCurrentMood(String title, String imagePath) =>
      Modular.to.pushNamed('/currentMood', arguments: [title, imagePath]);

  static Future<Object> toMoodCheckInScreen(Mood mood) => Modular.to.pushNamed(
        '/moodCheckIns',
        arguments: mood,
      );

  static Future<Object> toMoodCalendarScreen({Mood mood}) =>
      Modular.to.pushNamed(
        '/moodCalendar',
        arguments: mood,
      );

  static Future<Object> toEditMoodScreen(Mood mood) =>
      Modular.to.pushNamed('/editMood', arguments: mood);
}
