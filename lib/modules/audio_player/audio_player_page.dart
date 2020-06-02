import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/audio_player/audio_player_controller.dart';
import 'package:highvibe/modules/audio_player/widgets/widgets.dart';
import 'package:highvibe/services/audio_player_service.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';
import 'package:mobx/mobx.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState
    extends ModularState<AudioPlayerPage, AudioPlayerController>
    with TickerProviderStateMixin {
  AnimationController playButtonAnimation;
  AnimationController artworkAnimation;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.isMinimized
          ? ResponsiveSafeArea(
              builder: (context, size) => _audioWidget(context))
          : Material(child: _audioWidget(context)),
    );
  }

  @override
  void dispose() {
    playButtonAnimation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller.init();

    artworkAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    artworkAnimation.forward();

    playButtonAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    reaction((_) => controller.isPlaying, (val) {
      if (val) {
        playButtonAnimation.forward();
      } else {
        playButtonAnimation.reverse();
      }
    });

    super.initState();
  }

  Widget _audioWidget(BuildContext context) {
    return Align(
      alignment:
          controller.isMinimized ? Alignment.bottomCenter : Alignment.center,
      child: Container(
        color: controller.isMinimized ? mediaPlayerBackgroundColor : null,
        height: controller.isMinimized ? 80 : null,
        width: screenWidth(context),
        margin: EdgeInsets.only(left: 0, right: 0),
        child: Stack(
          children: [
            Opacity(
              opacity: controller.isMinimized ? 1 : 0.5,
              child: FadeTransition(
                opacity: artworkAnimation.drive(CurveTween(curve: Curves.easeOut)),
                child: Hero(
                  tag: 'audio#${controller.audioFile.id}',
                  child: Container(
                    width: controller.isMinimized ? 80 : null,
                    height: controller.isMinimized ? 80 : null,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          controller.audioFile.artworkUrlPath,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (!controller.isMinimized) ..._fullScreenAudioPlayer(),
            if (controller.isMinimized) ..._minimizedAudioPlayer(),
          ],
        ),
      ),
    );
  }

  void _close() async {
    controller.player.stop();
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

  AudioPlayerSkipButton _fastForwardButton() {
    return AudioPlayerSkipButton(
      buttonType: AudioPlayerSkipButtonType.fastForward,
      onPressed: () => controller.skip15Seconds(
        buttonType: AudioPlayerSkipButtonType.fastForward,
        trackPosition: controller.trackPosition,
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
                controller.audioFile.title,
                style: bold24PlayfairWhite,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  controller.audioFile.subTitle,
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
                Observer(
                  builder: (_) => AudioPlayerSlider(
                    trackPosition: controller.sliderPosition,
                    onChanged: (value) => controller.seekToPosition(value),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Observer(
                        builder: (_) => Text(
                          '${controller.positionText ?? ''}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        mediaTimeFormatter(
                          Duration(
                            milliseconds: controller.audioFile.duration,
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
                        onPressed: () => controller.togglePlayStop(),
                      ),
                      _fastForwardButton(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(
                      builder: (_) {
                        return IconButton(
                          icon: Icon(
                            Icons.repeat,
                            color: controller.isLoopMode
                                ? Colors.blue
                                : Colors.white,
                          ),
                          onPressed: controller.toggleLoopMode,
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _minimizedAudioPlayer() {
    return [
      Positioned(
        left: 90,
        top: 8,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 160,
            maxHeight: 40,
          ),
          child: Text(
            controller.audioFile.title,
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
          constraints: const BoxConstraints(
            maxWidth: 160,
            maxHeight: 40,
          ),
          child: Text(
            controller.audioFile.subTitle,
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
            onPressed: () => controller.togglePlayStop(),
          ),
        ),
      ),
      Positioned(
        right: 12,
        bottom: 4,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 80,
            maxHeight: 40,
          ),
          child: Observer(
            builder: (_) => Text(
              '${controller.positionText ?? ''}',
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
      ),
      GestureDetector(
        child: Container(
          width: screenWidth(context) / 1.5,
          color: Colors.transparent,
        ),
        onTap: () => controller.toggleAudioPlayerMode(),
      ),
    ];
  }

  Widget _minimizeScreenButton() {
    if (!controller.isMinimized) {
      return Positioned(
        top: 40,
        left: -16,
        child: FlatButton(
          onPressed: () => controller.toggleAudioPlayerMode(),
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
      onPressed: () => controller.skip15Seconds(
        buttonType: AudioPlayerSkipButtonType.rewind,
        trackPosition: controller.trackPosition,
      ),
    );
  }
}
