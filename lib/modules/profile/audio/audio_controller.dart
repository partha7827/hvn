import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'audio_controller.g.dart';

class AudioController = _AudioControllerBase with _$AudioController;

abstract class _AudioControllerBase with Store {
  final FirestoreService store = Modular.get<FirestoreService>();

  @observable
  ObservableFuture<List<Audio>> audios;

  @observable
  FutureStatus uploadStatus = FutureStatus.fulfilled;

  final String userId;

  _AudioControllerBase(this.userId);

  @action
  void loadAudios() {
    audios = ObservableFuture(
      store.audioCollection
          .where('userId', isEqualTo: userId)
          .getDocuments()
          .then((s) => Audio.parseListOfAudios(s).toList()),
    );
  }

  @action
  Future<void> uploadAudio(Audio audio) async {
    uploadStatus = FutureStatus.pending;
    try {
      await store.audioCollection.document(audio.id).setData(audio.toMap());
      uploadStatus = FutureStatus.fulfilled;
    } catch (error) {
      uploadStatus = FutureStatus.rejected;
    }
  }
}
