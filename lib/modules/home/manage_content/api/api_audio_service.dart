import 'package:flutter/foundation.dart' show required;
import 'package:highvibe/models/models.dart';

abstract class ApiAudioService {
  Stream<List<Audio>> audioCollectionStream();
  Stream<Audio> audioItemStream({@required String audioItemId});
  Future<void> deleteAudioItem({@required Audio audioItem});
  Future<void> setAudioItem({@required Audio audioItem});
}
