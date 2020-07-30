import 'package:flutter/foundation.dart' show required;
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/home/manage_content/api/api_audio_service.dart';
import 'package:highvibe/modules/home/manage_content/api/firebase_audio_api_path.dart';
import 'package:highvibe/services/firestore_api_service.dart';

class FirestoreAudioService implements ApiAudioService {
  final String userId;
  final _service = FirestoreApiService.instance;

  FirestoreAudioService({@required this.userId}) : assert(userId != null);

  @override
  Stream<List<Audio>> audioCollectionStream() {
    return _service.collectionStream(
      path: FirebaseAudioApiPath.audioItems(),
      queryBuilder: (query) => query.where('userId', isEqualTo: userId),
      builder: (data, documentId) {
        return AudioPlusFirestore.fromMap(data, documentId);
      },
    );
  }

  @override
  Stream<Audio> audioItemStream({@required String audioItemId}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAudioItem({@required Audio audioItem}) {
    return _service.deleteData(
      path: FirebaseAudioApiPath.audioItem(audioItem.id),
    );
  }

  @override
  Future<void> setAudioItem({@required Audio audioItem}) {
    return _service.setData(
      path: FirebaseAudioApiPath.audioItem(audioItem.id),
      data: audioItem.toMap(),
    );
  }
}
