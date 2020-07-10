import 'package:mobx/mobx.dart';

part 'edit_audio_controller.g.dart';

class EditAudioController = _EditAudioControllerBase
    with _$EditAudioController;

abstract class _EditAudioControllerBase with Store {
  final String audioId;
  _EditAudioControllerBase(this.audioId);
}