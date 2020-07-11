import 'package:built_collection/built_collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';
part 'discover_audios_controller.g.dart';

class DiscoverAudiosController = _DiscoverAudiosControllerBase
    with _$DiscoverAudiosController;

abstract class _DiscoverAudiosControllerBase with Store {
  final FirestoreService firestore = Modular.get<FirestoreService>();

  @observable
  ObservableFuture<BuiltList<Audio>> audios;

  @action
  void loadAudios() {
    audios = ObservableFuture(
      firestore.audioCollection
          .getDocuments()
          .then((s) => Audio.parseListOfAudios(s)),
    );
  }
}
