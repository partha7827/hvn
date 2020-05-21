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
  Color _screenBackgroundColor = Colors.transparent;
  bool isFullScreenMode = false;
  bool isMinimised = false;

  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (context, size) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(4),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_controller),
                      PlayPauseOverlay(controller: _controller),
                      _closeButton(context),
                      _fullScreenButton(),
                      if (!isFullScreenMode) _minimizeScreenButton(),
                      VideoProgressIndicator(_controller, allowScrubbing: true),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
    print('_minimizeVideoPlayer');
  }

  void _portretScreenOrientaionModes() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _toggleFullscreenMode() {
    if (isFullScreenMode) {
      isFullScreenMode = false;
      _portretScreenOrientaionModes();
    } else {
      isFullScreenMode = true;
      setState(() {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      });
    }
  }
}
