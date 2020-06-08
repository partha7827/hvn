import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show PlayList;
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/values/themes.dart';

class PlaylistTile extends StatefulWidget {
  final PlayList playList;
  final ValueChanged<PlayList> onTap;

  PlaylistTile({
    @required this.playList,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  _PlaylistTileState createState() => _PlaylistTileState();
}

class _PlaylistTileState extends State<PlaylistTile> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: widget.playList.coverUrlPath,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 70,
                height: 70,
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
              Positioned(
                top: 8,
                child: Text(
                  '${widget.playList.audioFilesIds.length}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Positioned(
                bottom: 8,
                child: Icon(Icons.playlist_play, size: 32),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.playList.title, style: normaBoldl16White),
                  const SizedBox(height: 8),
                  Text('Total duration', style: normal14Hint),
                ],
              ),
            ),
          ),
          IconButton(
            icon: _configureIcon(),
            onPressed: () => _toggle(),
          )
        ],
      ),
    );
  }

  Widget _configureIcon() {
    if (_isSelected) {
      return PlaylistImageAssets.radioButtonActive;
    } else {
      return PlaylistImageAssets.radioButtonNotActive;
    }
  }

  void _toggle() {
    if (_isSelected) {
      setState(() {
        _isSelected = false;
      });
    } else {
      setState(() {
        _isSelected = true;
      });
    }
  }
}
