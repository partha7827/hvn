import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/modules/audio_player/audio_player_service.dart';
import 'package:highvibe/modules/audio_player/widgets/widgets.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

import 'audio_player_controller.dart';

class AudioPlayerPage extends StatefulWidget {
  final String title;
  final Audio audioFile;

  const AudioPlayerPage({
    @required this.audioFile,
    this.title = "AudioPlayer",
    Key key,
  }) : super(key: key);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState
    extends ModularState<AudioPlayerPage, AudioPlayerController>
    with SingleTickerProviderStateMixin {
  final _audioPlayerService = Modular.get<AudioPlayerService>();

  AnimationController playButtonAnimation;
  String _positionText;
  Duration _trackPosition;
  bool _isPlaying = false;

  get audioFile => widget.audioFile;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (context, state) {
        return Material(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          CachedNetworkImageProvider(audioFile.artworkUrlPath),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                constraints:
                    BoxConstraints(minHeight: screenHeight(context) * 0.4),
                decoration:
                    BoxDecoration(gradient: darkToTransparentGradientTop),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        audioFile.title,
                        style: bold24PlayfairWhite,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          audioFile.subTitle,
                          style: normal16White,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: () => _close(context),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  constraints:
                      BoxConstraints(minHeight: screenHeight(context) * 0.4),
                  decoration:
                      BoxDecoration(gradient: darkToTransparentGradient),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                mediaTimeFormarter(
                                  Duration(milliseconds: audioFile.duration),
                                ),
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _rewindButton(),
                              AudioPlayerPlayButton(
                                progress: playButtonAnimation,
                                onPressed: () => _togglePlayStop(),
                              ),
                              _fastForwardButton(),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: SvgPicture.asset('assets/ic_favorite.svg'),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: SvgPicture.asset('assets/ic_playlist.svg'),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: SvgPicture.asset('assets/ic_share.svg'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _audioPlayerService.dispose();
    playButtonAnimation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    playButtonAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _configure();
    super.initState();
  }

  void _close(BuildContext context) {
    _audioPlayerService.stop();
    Navigator.pop(context);
  }

  void _configure() {
    _updateTrackPosition();
    _updatePlayerState();
  }

  Icon _configurePlayButtonIcon(bool isPlaying) {
    if (isPlaying) {
      return const Icon(Icons.pause);
    } else {
      return const Icon(Icons.play_circle_filled);
    }
  }

  AudioPlayerSkipButton _fastForwardButton() {
    return AudioPlayerSkipButton(
      buttonType: AudioPlayerSkipButtonType.fastForward,
      onPressed: () => _audioPlayerService.skip15seconds(
        buttonType: AudioPlayerSkipButtonType.fastForward,
        trackPosition: _trackPosition,
      ),
    );
  }

  AudioPlayerSkipButton _rewindButton() {
    return AudioPlayerSkipButton(
      buttonType: AudioPlayerSkipButtonType.rewind,
      onPressed: () => _audioPlayerService.skip15seconds(
        buttonType: AudioPlayerSkipButtonType.rewind,
        trackPosition: _trackPosition,
      ),
    );
  }

  void _togglePlayStop() {
    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying
          ? playButtonAnimation.forward()
          : playButtonAnimation.reverse();
    });
    _audioPlayerService.toggle(playPosition: _trackPosition);
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
            audioFile.duration != null &&
            _trackPosition.inMilliseconds > 0 &&
            _trackPosition.inMilliseconds < audioFile.duration)
        ? _trackPosition.inMilliseconds / audioFile.duration
        : 0;
  }

  void _updateTrackPosition() {
    _audioPlayerService.positionSubscription.onData((position) {
      setState(() {
        _trackPosition = position;
        if (_trackPosition >= Duration(milliseconds: audioFile.duration)) {
          _trackPosition = Duration(milliseconds: 0);
        }
        _positionText = _trackPosition?.toString()?.split('.')?.first ?? '';
        _updateSliderPosition();
      });
    });
  }
}
