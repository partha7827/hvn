import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/audio_player/audio_player_service.dart';
import 'package:highvibe/modules/audio_player/widgets/widgets.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';

enum AudioPlayerMode { fullScreenMode, minimised, none }

class AudioPlayerPage extends StatefulWidget {
  final Audio audioFile;

  const AudioPlayerPage({
    @required this.audioFile,
    Key key,
  }) : super(key: key);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage>
    with SingleTickerProviderStateMixin {
  AudioPlayerService _audioPlayerService;
  AnimationController playButtonAnimation;

  String _positionText;
  Duration _trackPosition;
  bool _isPlaying = false;
  AudioPlayerMode _audioPlayerMode = AudioPlayerMode.none;

  get _audioFile => widget.audioFile;
  bool get _isMinimised => _audioPlayerMode == AudioPlayerMode.minimised;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _isMinimised ? Alignment.bottomCenter : Alignment.center,
      child: Container(
        color: _isMinimised ? Colors.red : Colors.blue,
        height: _isMinimised ? 80 : null,
        margin: _isMinimised
            ? const EdgeInsets.only(left: 8, right: 8)
            : EdgeInsets.only(left: 0, right: 0),
        child: Stack(
          children: [
            Opacity(
              opacity: _isMinimised ? 1 : 0.5,
              child: Container(
                width: _isMinimised ? 80 : null,
                height: _isMinimised ? 80 : null,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        CachedNetworkImageProvider(_audioFile.artworkUrlPath),
                  ),
                ),
              ),
            ),
            Container(
              color: _isMinimised ? Colors.transparent : null,
              width: double.maxFinite,
              constraints:
                  BoxConstraints(minHeight: screenHeight(context) * 0.4),
              decoration: _isMinimised
                  ? null
                  : BoxDecoration(
                      gradient: darkToTransparentGradientTop,
                    ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      child: Text(
                        _audioFile.title,
                        style: bold24PlayfairWhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Material(
                        child: Text(
                          _audioFile.subTitle,
                          style: normal16White,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            _minimizeScreenButton(),
            if (!_isMinimised) _closeScreenButton(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                constraints: BoxConstraints(
                  minHeight: screenHeight(context) * 0.4,
                ),
                decoration: BoxDecoration(gradient: darkToTransparentGradient),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (!_isMinimised)
                        AudioPlayerSlider(
                          trackPosition: _updateSliderPosition(),
                          onChanged: (value) =>
                              _audioPlayerService.seekToPosition(value),
                        ),
                      if (!_isMinimised)
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Material(
                                child: Text(
                                  '${_positionText ?? ''}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Material(
                                child: Text(
                                  mediaTimeFormarter(
                                    Duration(milliseconds: _audioFile.duration),
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!_isMinimised) _rewindButton(),
                            AudioPlayerPlayButton(
                              progress: playButtonAnimation,
                              onPressed: () => _togglePlayStop(),
                            ),
                            if (!_isMinimised) _fastForwardButton(),
                          ],
                        ),
                      ),
                      if (!_isMinimised)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              child: IconButton(
                                icon:
                                    SvgPicture.asset('assets/ic_favorite.svg'),
                                onPressed: () {},
                              ),
                            ),
                            Material(
                              child: IconButton(
                                icon:
                                    SvgPicture.asset('assets/ic_playlist.svg'),
                                onPressed: () {},
                              ),
                            ),
                            Material(
                              child: IconButton(
                                icon: SvgPicture.asset('assets/ic_share.svg'),
                                onPressed: () {},
                              ),
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
      ),
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
    _configure();
    playButtonAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    super.initState();
  }

  void _close() {
    _audioPlayerService.stop();
    MediaOverlays.disposeAudioOverlayEntry();
  }

  Widget _closeScreenButton() {
    return Positioned(
      top: 20,
      right: -16,
      child: FlatButton(
        onPressed: () => _close(),
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }

  void _configure() {
    _configureAudioPlayerService();
    _updateTrackPosition();
    _updatePlayerState();
  }

  void _configureAudioPlayerService() {
    _audioPlayerService = AudioPlayerService(audioFile: widget.audioFile);
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

  Widget _minimizeScreenButton() {
    if (!_isMinimised) {
      return Positioned(
        top: 20,
        left: -16,
        child: FlatButton(
          onPressed: () => _toggleAudioPlayerMode(),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 32,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
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

  void _toggleAudioPlayerMode() {
    if (_audioPlayerMode != AudioPlayerMode.minimised) {
      setState(() => _audioPlayerMode = AudioPlayerMode.minimised);
    } else {
      setState(() => _audioPlayerMode = AudioPlayerMode.none);
    }
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
            _audioFile.duration != null &&
            _trackPosition.inMilliseconds > 0 &&
            _trackPosition.inMilliseconds < _audioFile.duration)
        ? _trackPosition.inMilliseconds / _audioFile.duration
        : 0;
  }

  void _updateTrackPosition() {
    _audioPlayerService.positionSubscription.onData((position) {
      setState(() {
        _trackPosition = position;
        if (_trackPosition >= Duration(milliseconds: _audioFile.duration)) {
          _trackPosition = Duration(milliseconds: 0);
        }
        _positionText = _trackPosition?.toString()?.split('.')?.first ?? '';
        _updateSliderPosition();
      });
    });
  }
}
