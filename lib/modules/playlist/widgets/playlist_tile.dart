import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show PlayList;
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';

class PlaylistTile extends StatefulWidget {
  final PlayList playList;
  final bool isInEditMode;
  final ValueChanged<PlayList> onTap;

  PlaylistTile({
    @required this.playList,
    @required this.onTap,
    @required this.isInEditMode,
    Key key,
  }) : super(key: key);

  @override
  _PlaylistTileState createState() => _PlaylistTileState();
}

class _PlaylistTileState extends State<PlaylistTile> {
  bool _isSelected = false;
  bool get _isEmptyOrHasOneTune => widget.playList.audioFiles.length <= 1;

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
              if (!_isEmptyOrHasOneTune) ...[
                Positioned(
                  top: 8,
                  child: Text(
                    '${widget.playList.audioFiles.length}',
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
              ]
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
                  Text(
                      mediaTimeFormatter(
                        Duration(
                          milliseconds: _calculateTotalDuration(),
                        ),
                      ),
                      style: normal14Hint),
                ],
              ),
            ),
          ),
          IconButton(
            icon: _configureIcon(),
            onPressed: () => _onPressed(),
          )
        ],
      ),
    );
  }

  int _calculateTotalDuration() {
    var totalDuration = 0;
    for (final item in widget.playList.audioFiles) {
      totalDuration += item.duration;
    }
    return totalDuration;
  }

  Widget _configureIcon() {
    if (widget.isInEditMode) {
      if (_isSelected) {
        return PlaylistImageAssets.radioButtonActive;
      } else {
        return PlaylistImageAssets.radioButtonNotActive;
      }
    } else {
      return PlaylistImageAssets.more;
    }
  }

  void _onPressed() {
    if (widget.isInEditMode) {
      _toggle();
      widget.onTap(widget.playList);
    } else {
      widget.onTap(widget.playList);
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
