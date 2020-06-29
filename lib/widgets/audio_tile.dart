import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/models/options_model/options_model.dart';
import 'package:highvibe/modules/playlist/resources/assets.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/constants.dart';
import 'package:highvibe/values/themes.dart';

class AudioTile extends StatelessWidget {
  final Audio audioFile;
  final ValueChanged<Audio> onTap;
  final Function onOptionsTap;
  final List<OptionsModel> optionsModelList;

  const AudioTile({
    @required this.audioFile,
    @required this.onTap,
    @required this.onOptionsTap,
    this.optionsModelList,
  });

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
                onSelected: (value) => onOptionsTap(audioFile, value),
                itemBuilder: (BuildContext context) {
                  return optionsModelList
                      ?.map(
                        (optionsModel) => PopupMenuItem<String>(
                          value: '${optionsModel.id}',
                          child: ListTile(
                            leading: optionsModel.widget,
                            title: Text(
                              optionsModel.text,
                              style: normal16White,
                            ),
                          ),
                        ),
                      )
                      ?.toList();
                })
          ],
        ),
      ),
    );
  }
}
