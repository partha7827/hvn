import 'package:highvibe/models/models.dart';

const _artworkUrl =
    'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg';
const _audioFileUrl = 'https://storage.googleapis.com/download/storage/v1/b/highvibe-8601d.appspot.com/o/sample.mp3?alt=media';

final mockAudioItemsList = [
  Audio(
    (b) => b
      ..author = 'Author'
      ..artworkUrlPath = _artworkUrl
      ..audioUrlPath = _audioFileUrl
      ..duration = 210000
      ..id = 'id-1'
      ..title = 'Relaxing Flute'
      ..subTitle = 'Lorem ipsum dolar sit a mat',
  ),
  Audio(
    (b) => b
      ..author = 'Author'
      ..artworkUrlPath = _artworkUrl
      ..audioUrlPath = _audioFileUrl
      ..duration = 210000
      ..id = 'id-1'
      ..title = 'Deep sleep'
      ..subTitle = 'Lorem ipsum dolar sit a mat',
  ),
  Audio(
    (b) => b
      ..author = 'Author'
      ..artworkUrlPath = _artworkUrl
      ..audioUrlPath = _audioFileUrl
      ..duration = 210000
      ..id = 'id-1'
      ..title = 'Feel your soul'
      ..subTitle = 'Lorem ipsum dolar sit a mat',
  ),
];
