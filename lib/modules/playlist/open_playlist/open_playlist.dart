import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/app/app_module.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/audio_player/widgets/audio_player_play_button.dart';
import 'package:highvibe/modules/audio_player/widgets/audio_player_slider.dart';
import 'package:highvibe/modules/playlist/open_playlist/open_playlist_controller.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/profile/show_audio/playlist_audio_tile.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/constants.dart';
import 'package:highvibe/values/themes.dart';
import 'package:mobx/mobx.dart';

class OpenPlaylistPage extends StatefulWidget {
  OpenPlaylistPage({
    @required this.playList,
  }) : super(key: MediaOverlays.audioKey);

  final PlayList playList;

  @override
  _OpenPlaylistPageState createState() => _OpenPlaylistPageState();
}

class _OpenPlaylistPageState
    extends ModularState<OpenPlaylistPage, OpenPlaylistController>
    with TickerProviderStateMixin {
  AnimationController artworkAnimation;
  AnimationController playButtonAnimation;
  bool isFavourite = false;

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

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: AppModule.audioPlayerPageIsOffstage,
      child: Observer(
        builder: (_) => controller.isMinimized
            ? SafeArea(child: _minimizedAudioPlayer())
            : Material(child: _fullScreenAudioPlayer(context)),
      ),
    );
  }

  Widget _fullScreenAudioPlayer(BuildContext context) {
    return Stack(
      children: <Widget>[
        _audioArtwork(),
        _gradientOverlay(context),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _header(),
              _audioPlayerAndPlayList(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    artworkAnimation.dispose();
    playButtonAnimation.dispose();
    super.dispose();
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: screenWidth(context),
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _minimizeAudioArtwork(),
                      const SizedBox(width: 10),
                      _audioDetails(),
                      _minimizedAudioPlayerButtons(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _linearProgressIndicator(context),
            ],
          ),
        ),
      ),
    );
  }

  Opacity _minimizeAudioArtwork() {
    return Opacity(
      opacity: 1,
      child: FadeTransition(
        opacity: artworkAnimation.drive(CurveTween(curve: Curves.easeOut)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  controller
                      .playList.audioFiles[controller.index].artworkUrlPath,
                ),
              ),
            ),
          ),
        ),
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
            '${widget.playList.audioFiles[controller.index].title}',
            style: bold16White,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            '${widget.playList.audioFiles[controller.index].subTitle}',
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

  Expanded _audioPlayerAndPlayList() {
    return Expanded(
      flex: 6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Observer(
            builder: (_) => AudioPlayerSlider(
              inActiveColor: Colors.white,
              activeColor: Colors.blue,
              trackPosition: controller.sliderPosition,
              onChanged: (value) => controller.seekToPosition(value),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  mediaTimeFormatter(controller.trackPosition),
                  style: normal14Hint,
                ),
                Text(
                  mediaTimeFormatter(
                    Duration(
                      milliseconds: controller
                          .playList.audioFiles[controller.index].duration,
                    ),
                  ),
                  style: normal14Hint,
                ),
              ],
            ),
          ),
          _audioPlayerButtons(),
          _playingNextText(),
          _audioLists(),
        ],
      ),
    );
  }

  Expanded _audioLists() {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: widget.playList.audioFiles.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                controller.index = index;
                controller.player.stop();
                controller.player
                    .play(controller.playList.audioFiles[index].audioUrlPath);
              },
              child: PlayListAudioTile(
                  audio: widget.playList.audioFiles[index],
                  isPlaying: index == controller.index && controller.isPlaying,
                  authorCallback: () {
                    controller.toggleAudioPlayerMode();
                  }),
            );
          },
        ),
      ),
    );
  }

  Container _playingNextText() {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 20,
        right: 20,
        left: 20,
      ),
      color: primaryColor,
      alignment: Alignment.centerLeft,
      child: Text('Playing Next', style: bold18PlayfairWhite),
    );
  }

  Widget _getIcon() {
    return isFavourite
        ? const Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : const Icon(
            Icons.favorite_border,
            color: Colors.white,
          );
  }

  Widget _getAudioButton() {
    return controller.isPlaying
        ? Image.asset(
            'assets/ic_pause.png',
            height: 36,
            width: 36,
          )
        : Container(
            padding:
                const EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 16),
            child: Image.asset(
              'assets/ic_play.png',
              height: 36,
              width: 36,
            ),
          );
  }

  Expanded _minimizedAudioPlayerButtons() {
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
            onPressed: () => PlaylistModule.toAddToPlaylist(
              audioFile: controller.playList.audioFiles[controller.index],
            ),
          ),
          AudioPlayerPlayButton(
            progress: playButtonAnimation,
            onPressed: () => controller.togglePlayStop(),
          ),
        ],
      ),
    );
  }

  Container _audioPlayerButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: _getIcon(),
            onPressed: _toggleFavourite,
          ),
          Opacity(
            opacity: _getPreviousButtonOpacity(),
            child: IconButton(
              icon: SvgPicture.asset('assets/ic_backward.svg'),
              onPressed: controller.playPreviousTrack,
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: _toggleAudioPlay,
            child: _getAudioButton(),
          ),
          Opacity(
            opacity: _getForwardButtonOpacity(),
            child: IconButton(
              icon: SvgPicture.asset('assets/ic_forward.svg'),
              onPressed: controller.playNextTrack,
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/ic_more.png',
              height: 24,
              width: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  double _getForwardButtonOpacity() {
    return controller.index == controller.playList.audioFiles.length - 1
        ? disabledOpacity
        : enabledOpacity;
  }

  double _getPreviousButtonOpacity() {
    return controller.index == 0 ? disabledOpacity : enabledOpacity;
  }

  void _toggleAudioPlay() {
    controller.togglePlayStop();
  }

  void _toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  Container _gradientOverlay(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.55,
      decoration: const BoxDecoration(
        gradient: darkToTransparentGradientBottom,
      ),
    );
  }

  Widget _header() {
    return Expanded(
      flex: 4,
      child: Container(
        alignment: Alignment.topCenter,
        width: screenWidth(context),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              onPressed: () {
                controller.toggleAudioPlayerMode();
              },
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text('${widget.playList.title}', style: bold18White)),
            ),
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () => _close(),
            ),
          ],
        ),
      ),
    );
  }

  void _close() async {
    await controller.player.stop();
    MediaOverlays.disposeAudioOverlayEntry();
  }

  Opacity _audioArtwork() {
    return Opacity(
      opacity: 1,
      child: FadeTransition(
        opacity: artworkAnimation.drive(CurveTween(curve: Curves.easeOut)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: screenHeight(context) * 0.55,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  widget.playList.audioFiles[controller.index].artworkUrlPath,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
