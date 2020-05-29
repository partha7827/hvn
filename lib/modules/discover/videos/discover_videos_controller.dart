import 'package:built_collection/built_collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';
part 'discover_videos_controller.g.dart';

class DiscoverVideosController = _DiscoverVideosControllerBase
    with _$DiscoverVideosController;

abstract class _DiscoverVideosControllerBase with Store {
  final firestore = Modular.get<FirestoreService>();

  @observable
  ObservableFuture<BuiltList<Video>> videos;

  @action
  void loadVideos() {
    videos = ObservableFuture(
      firestore.videoCollection
          .getDocuments()
          .then((s) => Video.parseListOfVideos(s)),
    );
  }
}
