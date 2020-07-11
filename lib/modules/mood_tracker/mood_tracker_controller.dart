import 'package:mobx/mobx.dart';
part 'mood_tracker_controller.g.dart';

class MoodTrackerController = _MoodTrackerControllerBase
    with _$MoodTrackerController;

abstract class _MoodTrackerControllerBase with Store {}
