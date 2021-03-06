import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'audio_controller.g.dart';

class AudioController = _AudioControllerBase with _$AudioController;

abstract class _AudioControllerBase with Store {
  final FirestoreService store = Modular.get<FirestoreService>();
  final AppController currentUserStore = Modular.get<AppController>();

  @observable
  ObservableFuture<List<Audio>> audios;

  final String userId;
  _AudioControllerBase(this.userId);
  User get currentUser => currentUserStore.currentUser;

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
