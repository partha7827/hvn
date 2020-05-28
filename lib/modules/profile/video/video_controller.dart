import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'video_controller.g.dart';

class VideoController = _VideoControllerBase with _$VideoController;

abstract class _VideoControllerBase with Store {
  final store = Modular.get<FirestoreService>();

  final String userId;
  _VideoControllerBase(this.userId);

  @observable
  ObservableFuture<List<Video>> videos;

  @action
  void loadVideos() {
    videos = ObservableFuture(
      store.videoCollection
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((s) => Video.parseListOfVideos(s).toList()),
    );
  }
}
