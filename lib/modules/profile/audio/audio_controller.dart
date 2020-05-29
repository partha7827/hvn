import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/audio/audio.dart';
import 'package:hvn/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'audio_controller.g.dart';

class AudioController = _AudioControllerBase with _$AudioController;

abstract class _AudioControllerBase with Store {
  final store = Modular.get<FirestoreService>();

  @observable
  ObservableFuture<List<Audio>> audios;

  final String userId;
  _AudioControllerBase(this.userId);

  @action
  void loadAudios() {
    audios = ObservableFuture(
      store.audioCollection
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((s) => Audio.parseListOfAudios(s).toList()),
    );
  }
}
