import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/mocks/mock_audio_files.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:mobx/mobx.dart';

part 'dev_controller.g.dart';

class DevController = _DevControllerBase with _$DevController;

abstract class _DevControllerBase with Store {
  final AppController app = Modular.get<AppController>();

  void toAudioPlayer({ BuildContext context }) {
    app.toAudioPlayer(context: context, audioFile: mockAudioItemsList[0]);
  }

  @action
  void init() {
    app.setCurrentUser(mockUser);
  }
}
