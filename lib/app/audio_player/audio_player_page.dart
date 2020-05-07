import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/app/utils/free_functions.dart';
import 'package:highvibe/app/audio_player/models/models.dart' show AudioFile;
import 'package:highvibe/app/audio_player/widgets/widgets.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';
import 'audio_player_controller.dart';

class AudioPlayerPage extends StatefulWidget {
  final String title;
  final AudioFile audioFile;

  const AudioPlayerPage({
    @required this.audioFile,
    this.title = "AudioPlayer",
    Key key,
  }) : super(key: key);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState
    extends ModularState<AudioPlayerPage, AudioPlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveSafeArea(
        builder: (context, state) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets +
                const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            curve: Curves.ease,
            duration: const Duration(milliseconds: 100),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              color: Colors.white70,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 4),
                  Align(
                    alignment: const Alignment(0.9, -0.6),
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      tooltip: 'Close',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      width: screenWidth(context),
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '${widget.audioFile.title}',
                                  style: const TextStyle(fontSize: 28),
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${widget.audioFile.subTitle}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _configureArtwork(context),
                  const SizedBox(height: 40),
                  AudioPlayerSlider(audioFile: widget.audioFile),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '1m 32 sec',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          mediaTimeFormarter(
                            Duration(
                              milliseconds: widget.audioFile.duration,
                            ),
                          ),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AudioPlayerSkipButton(
                        buttonType: AudioPlayerSkipButtonType.rewind,
                        onPressed: () => print('rewind'),
                      ),
                      AudioPlayerPlayButton(
                        onPressed: () => print('toggle'),
                      ),
                      AudioPlayerSkipButton(
                        buttonType: AudioPlayerSkipButtonType.fastForward,
                        onPressed: () =>print('fast forward'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _configureArtwork(BuildContext context) {
    if (aspectRatio(context) < 0.5) {
      return Image.network(
        widget.audioFile.artworkUrlPath,
        fit: BoxFit.cover,
      );
    } else {
      return Image.network(
        widget.audioFile.artworkUrlPath,
        height: screenHeight(context) - 450,
        fit: BoxFit.cover,
      );
    }
  }
}
