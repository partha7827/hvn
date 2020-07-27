import 'package:flutter/material.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/values/themes.dart';

class EmptyContent extends StatelessWidget {
  final String title;
  final String message;

  const EmptyContent({
    Key key,
    this.title = "You don't have any playlists yet.",
    this.message = 'Create one now!',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset('assets/ic_add_content.png'),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child:
                Text(title, style: normal16White),
          ),
          FlatButton(
            onPressed: () => PlaylistModule.toCreateNewPlaylist(),
            child: Text(message, style: normal16Accent),
          ),
        ],
      ),
    );
  }
}
