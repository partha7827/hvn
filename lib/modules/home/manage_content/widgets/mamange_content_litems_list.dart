import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/modules/home/manage_content/manage_content_contoller.dart';
import 'package:highvibe/modules/home/resources/resources.dart';
import 'package:highvibe/modules/home/manage_content/widgets/manage_content_list_tile.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/widgets.dart';

class ManageContentItemsList extends StatelessWidget {
  final ManageContentController controller;
  final VoidCallback onUploadPressed;
  final ValueChanged<Audio> onEditPressed;

  const ManageContentItemsList({
    @required this.controller,
    @required this.onUploadPressed,
    @required this.onEditPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDisplayDesktop = isDisplayDesktop(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
            bottom: 15,
          ),
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: _isDisplayDesktop ? Axis.horizontal : Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  15,
                  0,
                  40,
                  _isDisplayDesktop ? 0 : 15,
                ),
                child: const Text(
                  ManageContentStrings.myContent,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: screenWidth(context) / 5,
                  minHeight: 38,
                  maxWidth: screenWidth(context) / 2.5,
                  maxHeight: 38,
                ),
                child: TextField(
                  controller: controller.searchController,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Color(0xFF8E8F99)),
                    hintStyle: TextStyle(color: Color(0xFF8E8F99)),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF525366), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15, 11, 0, 11),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  _isDisplayDesktop ? 0 : 15,
                  0,
                  0,
                ),
                child: GradientRaisedButton(
                  minHeight: 38,
                  minWidth: 200,
                  label: ManageContentStrings.uploadContent,
                  buttonImage: ManageContentImageAssets.webUploadButton,
                  icon: Icons.file_upload,
                  onPressed: () => onUploadPressed(),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, color: Color(0xFF525366)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: StreamBuilder<List<Audio>>(
              stream: controller.fetchAudioItems(),
              builder: (context, snapshot) {
                return Scrollbar(
                  child: ListItemsBuilder<Audio>(
                    snapshot: snapshot,
                    itemBuilder: (context, item) {
                      return ManageContentListTile(
                        audioItem: item,
                        onTap: (value) => print(value.id),
                        onEdit: () => onEditPressed(item),
                        onDelete: () async =>
                            _audioItemDeleteConfirmationDialog(
                          context: context,
                          audioItem: item,
                        ),
                        onMore: () {
                          Scaffold.of(context).showSnackBar(
                            snackBarLight(
                              message: 'More is not implemented yet.',
                            ),
                          );
                        },
                      );
                    },
                    emptyContent: InkWell(
                      onTap: () => onUploadPressed(),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ManageContentImageAssets.webUploadPlaceholderButton,
                            const SizedBox(height: 32),
                            const Text(
                              ManageContentStrings.uploadYourFirstCOntent,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              ManageContentStrings.uploadYourFirstCOntent,
                              style: TextStyle(
                                color: Color(0xFF66CCCC),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _audioItemDeleteConfirmationDialog({
    @required BuildContext context,
    @required Audio audioItem,
  }) {
    showSuccessDialog(
      context: context,
      title: '${ManageContentStrings.delete} ${audioItem.title}?',
      subTitle: ManageContentStrings.deleteConfirmation,
      popsCount: 1,
      mainButtonImage: HomeImageAssets.webPortalBorderedButton,
      mainButtonTitle: ManageContentStrings.cancel,
      secondButtonImage: HomeImageAssets.webPortalFilleddButton,
      secondButtonTitle: '${ManageContentStrings.delete}',
      artworkImagePath: audioItem.artworkUrlPath,
      secondButtonAction: () {
        _deleteAudio(context: context, audioItem: audioItem);
      },
      isPresentedAsOverlay: false,
    );
  }

  Future<void> _deleteAudio({
    @required BuildContext context,
    @required Audio audioItem,
  }) async {
    try {
      await controller.deleteAudioFromFirebase(audioItem: audioItem);
      Navigator.pop(context);
      Scaffold.of(context).showSnackBar(
        snackBarLight(
          message: '${audioItem.title} ${ManageContentStrings.itemWasDeleted}',
        ),
      );
    } catch (error) {
      Scaffold.of(context).showSnackBar(
        snackBarLight(message: error.toString()),
      );
    }
  }
}
