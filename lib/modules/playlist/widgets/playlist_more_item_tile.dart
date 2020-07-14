import 'package:flutter/material.dart';

class PlaylistMoreItemTile extends StatelessWidget {
  final Image image;
  final String title;
  final GestureTapCallback onTap;

  const PlaylistMoreItemTile({
    @required this.image,
    @required this.title,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: image,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}
