import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/app/utils/free_functions.dart';
import 'package:highvibe/app/audio_player/audio_player_service.dart';
import 'package:highvibe/app/audio_player/widgets/widgets.dart';
import 'package:highvibe/models/models.dart' show AudioFile;
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
  final _audioPlayerService = Modular.get<AudioPlayerService>();
  String _positionText;
  Duration _trackPosition;
  bool _isPlaying = false;

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
                        _audioPlayerService.stop();
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
                                  style: const TextStyle(
                                    fontSize: 28,
                                  ),
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
                  AudioPlayerSlider(
                    trackPosition: _updateSliderPosition(),
                    onChanged: (value) =>
                        _audioPlayerService.seekToPosition(value),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_positionText ?? ''}',
                          style: const TextStyle(color: Colors.black87),
                        ),
                        Text(
                          mediaTimeFormarter(
                            Duration(
                              milliseconds: widget.audioFile.duration,
                            ),
                          ),
                          style: const TextStyle(color: Colors.black87),
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
                        onPressed: () => _audioPlayerService.skip15seconds(
                          buttonType: AudioPlayerSkipButtonType.rewind,
                          trackPosition: _trackPosition,
                        ),
                      ),
                      AudioPlayerPlayButton(
                        icon: _configurePlayButtonIcon(_isPlaying),
                        onPressed: () => _audioPlayerService.toggle(
                          playPosition: _trackPosition,
                        ),
                      ),
                      AudioPlayerSkipButton(
                        buttonType: AudioPlayerSkipButtonType.fastForward,
                        onPressed: () => _audioPlayerService.skip15seconds(
                          buttonType: AudioPlayerSkipButtonType.fastForward,
                          trackPosition: _trackPosition,
                        ),
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

  @override
  void dispose() {
    _audioPlayerService.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _configure();
    super.initState();
  }

  void _configure() {
    _updateTrackPosition();
    _updatePlayerState();
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

  Icon _configurePlayButtonIcon(bool isPlaying) {
    if (isPlaying) {
      return const Icon(Icons.pause);
    } else {
      return const Icon(Icons.play_circle_filled);
    }
  }

  void _updatePlayerState() {
    _audioPlayerService.playerStateSubscription.onData((state) {
      setState(() {
        _isPlaying = _audioPlayerService.isPlaying;
        _configurePlayButtonIcon(_isPlaying);
      });
    });
  }

  double _updateSliderPosition() {
    return (_trackPosition != null &&
            widget.audioFile.duration != null &&
            _trackPosition.inMilliseconds > 0 &&
            _trackPosition.inMilliseconds < widget.audioFile.duration)
        ? _trackPosition.inMilliseconds / widget.audioFile.duration
        : 0;
  }

  void _updateTrackPosition() {
    _audioPlayerService.positionSubscription.onData((position) {
      setState(() {
        _trackPosition = position;
        if (_trackPosition >=
            Duration(milliseconds: widget.audioFile.duration)) {
          _trackPosition = Duration(milliseconds: 0);
        }
        _positionText = _trackPosition?.toString()?.split('.')?.first ?? '';
        _updateSliderPosition();
      });
    });
  }
}
