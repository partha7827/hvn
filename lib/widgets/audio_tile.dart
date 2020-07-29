import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/playlist/resources/assets.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';

class AudioTile extends StatelessWidget {
  final Audio audioFile;
  final ValueChanged<Audio> onTap;

  const AudioTile({
    @required this.audioFile,
    @required this.onTap,
  });

  bool get isCreator =>
      audioFile.userId == Modular.get<AppController>().currentUser.id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(audioFile),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Hero(
              tag: 'audio#${audioFile.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: audioFile.artworkUrlPath,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(audioFile.title, style: normal16White),
                    const SizedBox(height: 8),
                    Text(
                      mediaTimeFormatter(
                        Duration(
                          milliseconds: audioFile.duration,
                        ),
                      ),
                      style: normal14Hint,
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuButton(
              icon: PlaylistImageAssets.more,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: secondaryColor,
              onSelected: (value) {
                if (value == 'edit') {
                  ProfileModule.toEditAudio(audioFile);
                }
              },
              itemBuilder: (_) => [
                if (isCreator) ...[
                  _buildMenuItem(
                    id: 'edit',
                    title: 'Edit',
                    iconPath: 'assets/ic_highlight.png',
                  ),
                  // _buildMenuItem(
                  //   id: 'waypoints',
                  //   title: 'Add WayPoints',
                  //   iconPath: 'assets/ic_waypoint.png',
                  // ),
                  _buildMenuItem(
                    id: 'delete',
                    title: 'Delete',
                    iconPath: 'assets/ic_delete.png',
                  ),
                ],
                _buildMenuItem(
                  id: 'add-to-playlist',
                  title: 'Add to Playlist',
                  iconPath: 'assets/ic_add_to_playlist.png',
                ),
                // _buildMenuItem(
                //   id: 'add-to-favorites',
                //   title: 'Add to Favorites',
                //   iconPath: 'assets/ic_favorite.png',
                // ),
                // _buildMenuItem(
                //   id: 'share',
                //   title: 'Share',
                //   iconPath: 'assets/ic_share.png',
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem({
    String id,
    String title,
    String iconPath,
  }) {
    return PopupMenuItem<String>(
      value: id,
      child: ListTile(
        leading: Image.asset(
          '$iconPath',
          width: 24,
          height: 24,
        ),
        title: Text(title, style: normal16White),
      ),
    );
  }
}
