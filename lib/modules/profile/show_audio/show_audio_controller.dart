import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'show_audio_controller.g.dart';


class ShowAudioController = _ShowAudioControllerBase with _$ShowAudioController;

abstract class _ShowAudioControllerBase with Store {
  final FirestoreService store = Modular.get<FirestoreService>();

  @observable
  ObservableFuture<List<Audio>> audios;

  final String userId;

  _ShowAudioControllerBase(this.userId);

  @action
  void loadAudios() {
    audios = ObservableFuture(
      store.audioCollection
          .where('userId', isEqualTo: userId)
          .getDocuments()
          .then((s) => Audio.parseListOfAudios(s).toList()),
    );
  }

}
