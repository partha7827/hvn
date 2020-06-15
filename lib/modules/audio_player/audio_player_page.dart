import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/audio_player/audio_player_controller.dart';
import 'package:highvibe/modules/audio_player/widgets/widgets.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/services/audio_player_service.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';
import 'package:mobx/mobx.dart';

class AudioPlayerPage extends StatefulWidget {
  AudioPlayerPage() : super(key: MediaOverlays.audioKey);
  @override
  AudioPlayerPageState createState() => AudioPlayerPageState();
}

class AudioPlayerPageState
    extends ModularState<AudioPlayerPage, AudioPlayerController>
    with TickerProviderStateMixin {
  AnimationController playButtonAnimation;
  AnimationController artworkAnimation;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.isMinimized
          ? SafeArea(child: _minimizedAudioPlayer())
          : Material(child: _fullScreenAudioPlayer()),
    );
  }

  @override
  void dispose() {
    playButtonAnimation.dispose();
    artworkAnimation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller.init();

    artworkAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    artworkAnimation.forward();

    playButtonAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    reaction(
      (_) => controller.isPlaying,
      (val) {
        if (val) {
          playButtonAnimation.forward();
        } else {
          playButtonAnimation.reverse();
        }
      },
    );

    super.initState();
  }

  Widget _minimizedAudioPlayer() {
    return GestureDetector(
      onTap: controller.toggleAudioPlayerMode,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF212342),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          width: screenWidth(context),
          margin: const EdgeInsets.only(left: 0, right: 0),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _audioArtwork(),
                          const SizedBox(
                            width: 10,
                          ),
                          _audioDetails(),
                          _audioPlayerButtons(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _linearProgressIndicator(context),
            ],
          ),
        ),
      ),
    );
  }

  Opacity _audioArtwork() {
    return Opacity(
      opacity: 1,
      child: FadeTransition(
        opacity: artworkAnimation.drive(CurveTween(curve: Curves.easeOut)),
        child: Hero(
          tag: 'audio#${controller.audioFile.id}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 48,
              height: 48,
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
    );
  }

  Expanded _audioPlayerButtons() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {}),
          AudioPlayerPlayButton(
            progress: playButtonAnimation,
            onPressed: () => controller.togglePlayStop(),
          ),
        ],
      ),
    );
  }

  Expanded _audioDetails() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${controller.audioFile.title}',
            style: bold16White,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${controller.audioFile.subTitle}',
            style: normal14White,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Container _linearProgressIndicator(BuildContext context) {
    return Container(
      color: mediaPlayerBackgroundColor,
      height: 5,
      alignment: Alignment.centerLeft,
      child: Observer(
        builder: (_) => Container(
          width: controller.sliderPosition * screenWidth(context),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFF666CCC), Color(0xFF66CCCC)]),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _closeScreenButton() {
    return Positioned(
      top: 32,
      right: -16,
      child: FlatButton(
        onPressed: () => _close(),
        child: const Icon(
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

  Widget _fullScreenAudioPlayer() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: screenWidth(context),
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: FadeTransition(
                opacity:
                    artworkAnimation.drive(CurveTween(curve: Curves.easeOut)),
                child: Hero(
                  tag: 'audio#${controller.audioFile.id}',
                  child: Container(
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
            Container(
              width: double.maxFinite,
              constraints:
                  BoxConstraints(minHeight: screenHeight(context) * 0.4),
              decoration: const BoxDecoration(
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
                decoration:
                    const BoxDecoration(gradient: darkToTransparentGradient),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Observer(
                        builder: (_) => AudioPlayerSlider(
                          trackPosition: controller.sliderPosition,
                          onChanged: (value) =>
                              controller.seekToPosition(value),
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
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.playlist_add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                PlaylistModule.toAddToPlaylist(
                                  audioFile: controller.audioFile,
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _minimizeScreenButton() {
    if (!controller.isMinimized) {
      return Positioned(
        top: 40,
        left: -16,
        child: FlatButton(
          onPressed: () => controller.toggleAudioPlayerMode(),
          child: const Icon(
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

  void _close() async {
    await controller.player.stop();
    MediaOverlays.disposeAudioOverlayEntry();
  }
}
