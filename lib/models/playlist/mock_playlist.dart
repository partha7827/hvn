import 'package:built_collection/built_collection.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/models/privacy/privacy.dart';

final List<PlayList> tempInMemoryPlaylistCollection = [];

final List<PlayList> mockPlaylists = [
  PlayList(
    (b) => b
      ..coverUrlPath =
          'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg'
      ..desscription = ''
      ..title = 'Feel Your Soul'
      ..privacy = Privacy.public
      ..audioFilesIds.addAll(
        BuiltList.from(Iterable<String>.generate(49, (item) => '').toList()),
      ),
  ),
  PlayList(
    (b) => b
      ..coverUrlPath =
          'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg'
      ..desscription = ''
      ..title = 'Pure Positive Vibes'
      ..privacy = Privacy.public
      ..audioFilesIds.addAll(
        BuiltList.from(Iterable<String>.generate(9, (item) => '').toList()),
      ),
  ),
  PlayList(
    (b) => b
      ..coverUrlPath =
          'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg'
      ..desscription = ''
      ..title = 'Daily Meditation'
      ..privacy = Privacy.public
      ..audioFilesIds.addAll(
        BuiltList.from(Iterable<String>.generate(27, (item) => '').toList()),
      ),
  ),
  PlayList(
    (b) => b
      ..coverUrlPath =
          'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg'
      ..desscription = ''
      ..title = 'Feel Your Body'
      ..privacy = Privacy.public
      ..audioFilesIds.addAll(
        BuiltList.from(Iterable<String>.generate(75, (item) => '').toList()),
      ),
  ),
];
