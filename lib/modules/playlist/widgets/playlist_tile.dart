import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/models/models.dart' show PlayList;
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
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              Text('45', style: normal16White),
              const Icon(Icons.playlist_play),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.playList.title, style: normal16White),
                  Text('Total duration', style: normal14Hint),
                ],
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/ic_play.svg'),
            onPressed: () => print('Selected'),
          )
        ],
      ),
    );
  }
}
