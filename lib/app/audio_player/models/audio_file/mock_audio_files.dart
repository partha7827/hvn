import 'package:highvibe/app/audio_player/models/models.dart';

const _artworkUrl =
    'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg';
const _audioFileUrl =
    'https://api-flutter-audio-player.herokuapp.com/assets/audio/bensound-erf.mp3';

final mockAudioItemsList = [
  AudioFile(
    (b) => b
      ..author = 'Author'
      ..artworkUrlPath = _artworkUrl
      ..audioFileUrlPath = _audioFileUrl
      ..duration = 264600
      ..id = 'id-1'
      ..title = 'Relaxing Flute'
      ..subTitle = 'Lorem ipsum dolar sit a mat',
  ),
  AudioFile(
    (b) => b
      ..author = 'Author'
      ..artworkUrlPath = _artworkUrl
      ..audioFileUrlPath = _audioFileUrl
      ..duration = 264600
      ..id = 'id-1'
      ..title = 'Deep sleep'
      ..subTitle = 'Lorem ipsum dolar sit a mat',
  ),
  AudioFile(
    (b) => b
      ..author = 'Author'
      ..artworkUrlPath = _artworkUrl
      ..audioFileUrlPath = _audioFileUrl
      ..duration = 264600
      ..id = 'id-1'
      ..title = 'Feel your soul'
      ..subTitle = 'Lorem ipsum dolar sit a mat',
  ),
];
