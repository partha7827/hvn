import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show Video;
import 'package:highvibe/modules/video_player/video_player_strore.dart';
import 'package:highvibe/modules/video_player/widgets/widgets.dart'
    show PlayPauseOverlay;
import 'package:highvibe/widgets/responsive_safe_area.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String title;
  final Video video;

  const VideoPlayerPage({
    @required this.video,
    this.title = 'Video Player',
    Key key,
  }) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState
    extends ModularState<VideoPlayerPage, VideoPlayerStore> {
  VideoPlayerController _controller;
  Color _screenBackgroundColor = Colors.black;
  bool _isFullScreenMode = false;
  bool _isMinimised = false;

  Widget build(BuildContext context) {
    print('_isMinimised $_isMinimised');
    return Scaffold(
      backgroundColor: _screenBackgroundColor,
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: _isMinimised ? 300 : 20,
            // alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  PlayPauseOverlay(controller: _controller),
                  _closeButton(context),
                  _fullScreenButton(),
                  if (!_isFullScreenMode) _minimizeScreenButton(),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                  Row(
                    children: <Widget>[
                      Container(height: 80, width: 100, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        widget.video.snippet.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                      ),
                      _minimisedPlayStopButton(),
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
    _portretScreenOrientaionModes();
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    _allScreenOrientaionModes();
    _configureVideoController();
    super.initState();
  }

  void _allScreenOrientaionModes() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _close(BuildContext context) {
    _controller.pause();
    Navigator.pop(context);
  }

  Widget _closeButton(BuildContext context) {
    return Positioned(
      top: 0,
      right: -24,
      child: FlatButton(
        onPressed: () => _close(context),
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }

  void _configureVideoController() {
    _controller = VideoPlayerController.network(widget.video.fileDetails.url);
    _controller.addListener(() => setState(() {}));
    _controller.initialize().then((_) => setState(() {}));
  }

  Widget _fullScreenButton() {
    return Positioned(
      bottom: 8,
      right: -24,
      child: FlatButton(
        onPressed: () => _toggleFullscreenMode(),
        child: Icon(
          Icons.fullscreen,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }

  Icon _minimisedPlaybackIcon() {
    if (_controller.value.isPlaying) {
      return Icon(Icons.pause, color: Colors.yellow, size: 48);
    } else {
      return Icon(Icons.play_arrow, color: Colors.yellow, size: 48);
    }
  }

  Widget _minimisedPlayStopButton() {
    return Positioned(
      child: FlatButton(
          onPressed: () => _toggleVideoPlaybackForMinimisedMode(),
          child: _minimisedPlaybackIcon()),
    );
  }

  Widget _minimizeScreenButton() {
    return Positioned(
      top: 0,
      left: -24,
      child: FlatButton(
        onPressed: () => _minimizeVideoPlayer(),
        child: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }

  void _minimizeVideoPlayer() {
    if (!_isMinimised) {
      setState(() {
        _isMinimised = true;
        _screenBackgroundColor = Colors.transparent;
      });
    } else {
      setState(() {
        _isMinimised = false;
        _screenBackgroundColor = Colors.black;
      });
    }
  }

  void _portretScreenOrientaionModes() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _toggleFullscreenMode() {
    if (_isFullScreenMode) {
      _isFullScreenMode = false;
      _portretScreenOrientaionModes();
    } else {
      _isFullScreenMode = true;
      setState(() {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      });
    }
  }

  void _toggleVideoPlaybackForMinimisedMode() {
    _controller.value.isPlaying ? _controller.pause() : _controller.play();
  }
}
