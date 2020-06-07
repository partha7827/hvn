import 'package:built_collection/built_collection.dart';
import 'package:highvibe/models/playlist/playlist.dart';

final List<PlayList> tempInMemoryPlaylistCollection = [];

final List<PlayList> mockPlaylists = [
  PlayList(
    (b) => b
      ..coverUrlPath = ''
      ..desscription = ''
      ..title = 'Feel Your Soul'
      ..audioFilesIds.addAll(
        BuiltList.from(['']),
      ),
  ),
  PlayList(
    (b) => b
      ..coverUrlPath = ''
      ..desscription = ''
      ..title = 'Pure Positive Vibes'
      ..audioFilesIds.addAll(
        BuiltList.from(['']),
      ),
  ),
  PlayList(
    (b) => b
      ..coverUrlPath = ''
      ..desscription = ''
      ..title = 'Daily Meditation'
      ..audioFilesIds.addAll(
        BuiltList.from(['']),
      ),
  ),
];
