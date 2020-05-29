import 'package:built_collection/built_collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/models.dart' show Audio;
import 'package:hvn/services/firestore_service.dart';
import 'package:mobx/mobx.dart';
part 'discover_audios_controller.g.dart';

class DiscoverAudiosController = _DiscoverAudiosControllerBase
    with _$DiscoverAudiosController;

abstract class _DiscoverAudiosControllerBase with Store {
  final firestore = Modular.get<FirestoreService>();

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
