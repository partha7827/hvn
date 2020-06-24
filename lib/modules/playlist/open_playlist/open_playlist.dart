import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/audio_player/widgets/audio_player_slider.dart';
import 'package:highvibe/modules/playlist/open_playlist/open_playlist_controller.dart';
import 'package:highvibe/modules/profile/audio/playlist_audio_tile.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';

class OpenPlaylistPage extends StatefulWidget {
  OpenPlaylistPage({
    @required this.playList,
  });

  final PlayList playList;

  @override
  _OpenPlaylistPageState createState() => _OpenPlaylistPageState();
}

class _OpenPlaylistPageState
    extends ModularState<OpenPlaylistPage, OpenPlaylistController>
    with SingleTickerProviderStateMixin {
  AnimationController artworkAnimation;
  bool isAudioPlaying = false, isFavourite = false;

  @override
  void initState() {
    artworkAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    artworkAnimation.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    artworkAnimation.dispose();
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
                trackPosition: 0.4,
                // controller.sliderPosition,
                onChanged: (value) {}
                // controller.seekToPosition(value),
                ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '04:32',
                  style: normal14Hint,
                ),
                Text(
                  '-3:27',
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
            return PlayListAudioTile(
              audio: widget.playList.audioFiles[index],
              isPlaying: index == 0,
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
        ? Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : Icon(
            Icons.favorite_border,
            color: Colors.white,
          );
  }

  Widget _getAudioButton() {
    return isAudioPlaying
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

  Container _audioPlayerButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: _getIcon(),
            onPressed: _toggleFavourite,
          ),
          IconButton(
            icon: SvgPicture.asset('assets/ic_backward.svg'),
            onPressed: () {},
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: _toggleAudioPlay,
            child: _getAudioButton(),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/ic_forward.svg'),
            onPressed: () {},
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

  void _toggleAudioPlay() {
    setState(() {
      isAudioPlaying = !isAudioPlaying;
    });
  }

  void _toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  Container _gradientOverlay(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.55,
      decoration: BoxDecoration(
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
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              onPressed: () => Modular.to.pop(),
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text('${widget.playList.title}', style: bold18White)),
            ),
            IconButton(
                icon: SvgPicture.asset('assets/ic_playlist.svg'),
                onPressed: () {}),
          ],
        ),
      ),
    );
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
                  widget.playList.audioFiles[0].artworkUrlPath,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
