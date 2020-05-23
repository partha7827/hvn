import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highvibe/models/models.dart' show Video;
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/video_player/widgets/widgets.dart'
    show PlayPauseOverlay;
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';
import 'package:video_player/video_player.dart';

enum VideoPlayerMode { fullScreenMode, minimised, none }

class VideoPlayerPage extends StatefulWidget {
  final Video video;

  const VideoPlayerPage({
    @required this.video,
    Key key,
  }) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController _controller;
  VideoPlayerMode _videoPlayerMode = VideoPlayerMode.none;
  bool get _isMinimised => _videoPlayerMode == VideoPlayerMode.minimised;

  Widget build(BuildContext context) {
    if (_isMinimised) {
      return _videoWidget();
    } else {
      return Container(color: Colors.black, child: _videoWidget());
    }
  }

  @override
  void dispose() {
    _portretScreenOrientaionModes();
    _controller.dispose();
    if (videoOverlayEntry != null) {
      videoOverlayEntry.remove();
    }
    super.dispose();
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
    videoOverlayEntry.remove();
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
      return Icon(Icons.pause, color: Colors.white, size: 48);
    } else {
      return Icon(Icons.play_arrow, color: Colors.white, size: 48);
    }
  }

  Widget _minimizeScreenButton() {
    if (!_isMinimised) {
      return Positioned(
        top: 0,
        left: -24,
        child: FlatButton(
          onPressed: () => _toggleVideoPlayerMode(),
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

  void _portretScreenOrientaionModes() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _toggleFullscreenMode() {
    if (_videoPlayerMode == VideoPlayerMode.fullScreenMode) {
      setState(() {
        _videoPlayerMode = VideoPlayerMode.none;
        _portretScreenOrientaionModes();
      });
    } else if (_videoPlayerMode == VideoPlayerMode.none) {
      setState(() {
        _videoPlayerMode = VideoPlayerMode.fullScreenMode;
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

  void _toggleVideoPlayerMode() {
    if (_videoPlayerMode != VideoPlayerMode.minimised) {
      setState(() => _videoPlayerMode = VideoPlayerMode.minimised);
    } else {
      setState(() => _videoPlayerMode = VideoPlayerMode.none);
    }
  }

  Widget _videoWidget() {
    return ResponsiveSafeArea(
      builder: (context, size) {
        return Align(
          alignment: _isMinimised ? Alignment.bottomCenter : Alignment.center,
          child: Container(
            margin: _isMinimised
                ? const EdgeInsets.only(left: 8, right: 8)
                : EdgeInsets.only(left: 0, right: 0),
            color: secondaryColor,
            height: _isMinimised ? 80 : null,
            width: _isMinimised ? size.width : null,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: _isMinimised
                    ? Alignment.centerLeft
                    : Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    height: _isMinimised ? 80 : null,
                    width: _isMinimised ? 120 : null,
                    child: VideoPlayer(_controller),
                  ),
                  if (!_isMinimised) PlayPauseOverlay(controller: _controller),
                  Positioned(
                    top: _isMinimised ? null : 0,
                    right: _isMinimised ? -12 : -24,
                    child: FlatButton(
                      onPressed: () => _close(context),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  if (!_isMinimised) _fullScreenButton(),
                  if (portraitOrientation(context)) _minimizeScreenButton(),
                  if (!_isMinimised)
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                    ),
                  if (_isMinimised)
                    Positioned(
                      left: 130,
                      top: 8,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 120,
                          maxHeight: 40,
                        ),
                        child: Text(
                          widget.video.snippet.title,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  if (_isMinimised)
                    Positioned(
                      left: 130,
                      top: 50,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 120,
                          maxHeight: 40,
                        ),
                        child: Text(
                          widget.video.snippet.description,
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
                  if (_isMinimised)
                    Positioned(
                      right: 50,
                      child: FlatButton(
                        onPressed: () => _toggleVideoPlaybackForMinimisedMode(),
                        child: _minimisedPlaybackIcon(),
                      ),
                    ),
                  if (_isMinimised)
                    GestureDetector(
                      child: Container(
                        width: size.width / 1.7,
                        color: Colors.transparent,
                      ),
                      onTap: () => _toggleVideoPlayerMode(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
