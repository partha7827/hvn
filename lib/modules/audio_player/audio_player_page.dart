import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hvn/models/models.dart' show Audio;
import 'package:hvn/modules/app/media_overlays.dart';
import 'package:hvn/modules/audio_player/audio_player_service.dart';
import 'package:hvn/modules/audio_player/widgets/widgets.dart';
import 'package:hvn/utils/utils.dart';
import 'package:hvn/values/themes.dart';
import 'package:hvn/widgets/responsive_safe_area.dart';

enum AudioPlayerMode { fullScreen, minimised, none }

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

  bool get _isMinimised => _audioPlayerMode == AudioPlayerMode.minimised;

  @override
  Widget build(BuildContext context) {
    if (!_isMinimised) {
      return Material(child: _audioWidget(context));
    } else {
      return ResponsiveSafeArea(
        builder: (context, size) {
          return _audioWidget(context);
        },
      );
    }
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

  Widget _audioWidget(BuildContext context) {
    return Align(
      alignment: _isMinimised ? Alignment.bottomCenter : Alignment.center,
      child: Container(
        color: _isMinimised ? mediaPlayerBackgroundColor : null,
        height: _isMinimised ? 80 : null,
        width: screenWidth(context),
        margin: _isMinimised
            ? const EdgeInsets.only(left: 8, right: 8, bottom: 8)
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
                    image: CachedNetworkImageProvider(
                      widget.audioFile.artworkUrlPath,
                    ),
                  ),
                ),
              ),
            ),
            if (!_isMinimised) ..._fullScreenAudioPlayer(),
            if (_isMinimised) ..._minimisedAudioPlayer(),
          ],
        ),
      ),
    );
  }

  void _close() async {
    await _audioPlayerService.stop();
    MediaOverlays.disposeAudioOverlayEntry();
  }

  Widget _closeScreenButton() {
    return Positioned(
      top: 32,
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

  AudioPlayerSkipButton _fastForwardButton() {
    return AudioPlayerSkipButton(
      buttonType: AudioPlayerSkipButtonType.fastForward,
      onPressed: () => _audioPlayerService.skip15seconds(
        buttonType: AudioPlayerSkipButtonType.fastForward,
        trackPosition: _trackPosition,
      ),
    );
  }

  List<Widget> _fullScreenAudioPlayer() {
    return [
      Container(
        width: double.maxFinite,
        constraints: BoxConstraints(minHeight: screenHeight(context) * 0.4),
        decoration: BoxDecoration(
          gradient: darkToTransparentGradientTop,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.audioFile.title,
                style: bold24PlayfairWhite,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  widget.audioFile.subTitle,
                  style: normal16White,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
      _closeScreenButton(),
      _minimizeScreenButton(),
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
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
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
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        mediaTimeFormarter(
                          Duration(
                            milliseconds: widget.audioFile.duration,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
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
      ),
    ];
  }

  List<Widget> _minimisedAudioPlayer() {
    return [
      Positioned(
        left: 90,
        top: 8,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 160,
            maxHeight: 40,
          ),
          child: Text(
            widget.audioFile.title,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
      Positioned(
        left: 90,
        top: 50,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 160,
            maxHeight: 40,
          ),
          child: Text(
            widget.audioFile.subTitle,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
      Positioned(
        right: 12,
        top: 8,
        child: Container(
          width: 45,
          height: 45,
          child: AudioPlayerPlayButton(
            progress: playButtonAnimation,
            onPressed: () => _togglePlayStop(),
          ),
        ),
      ),
      Positioned(
        right: 12,
        bottom: 4,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 80,
            maxHeight: 40,
          ),
          child: Text(
            '${_positionText ?? ''}',
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
      GestureDetector(
        child: Container(
          width: screenWidth(context) / 1.5,
          color: Colors.transparent,
        ),
        onTap: () => _toggleAudioPlayerMode(),
      ),
    ];
  }

  Widget _minimizeScreenButton() {
    if (!_isMinimised) {
      return Positioned(
        top: 40,
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
        _isPlaying
            ? playButtonAnimation.forward()
            : playButtonAnimation.reverse();
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
