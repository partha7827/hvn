import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/values/themes.dart';

class AudioPlayer extends StatefulWidget {
  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imgUrl =
        'https://images.unsplash.com/photo-1520206183501-b80df61043c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80';
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(imgUrl),
                ),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.4,
            ),
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
                    'Deep Sleep Guided Meditation',
                    style: bold24PlayfairWhite,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      '''A simple way of freeing your mind, forgetting about daily anxieties and focusing on mental relaxation.''',
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
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              decoration: BoxDecoration(
                gradient: darkToTransparentGradient,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset('assets/ic_backward.svg'),
                            onPressed: () {},
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: AnimatedIcon(
                              icon: AnimatedIcons.play_pause,
                              color: accentColor,
                              progress: _controller,
                            ),
                            onPressed: () {
                              print('_isPlaying: $_isPlaying');
                              setState(() {
                                _isPlaying = !_isPlaying;
                                _isPlaying
                                    ? _controller.forward()
                                    : _controller.reverse();
                              });
                            },
                          ),
                          IconButton(
                            icon: SvgPicture.asset('assets/ic_forward.svg'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset('assets/ic_stop.svg'),
                          onPressed: () {},
                        ),
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
  }
}
