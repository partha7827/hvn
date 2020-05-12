import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show AudioFile, User;
import 'package:highvibe/services/store_service.dart';
import 'package:highvibe/store/current_user_store.dart';
import 'package:mobx/mobx.dart';

part 'audio_controller.g.dart';

class AudioController = _AudioControllerBase with _$AudioController;

abstract class _AudioControllerBase with Store {
  final store = Modular.get<StoreService>();

  User get user => Modular.get<CurrentUserStore>().currentUser;

  @observable
  bool readyFiles;

  @observable
  List<AudioFile> audioFiles;

  @action
  Future<void> init() async {
    for (final id in user.audioFileIds) {
      final audioFile = await store.fetchAudioFile(id);
      audioFiles.add(audioFile);
    }
  }
}
