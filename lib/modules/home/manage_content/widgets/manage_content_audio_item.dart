import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/modules/home/manage_content/manage_content_contoller.dart';
import 'package:highvibe/modules/home/manage_content/widgets/upload_content_textfield.dart';
import 'package:highvibe/modules/home/manage_content/widgets/manage_content_view_model.dart';
import 'package:highvibe/modules/home/manage_content/widgets/manage_content_audio_item_tags.dart';
import 'package:highvibe/modules/home/resources/resources.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/widgets.dart';

class ManageAudioContentItem extends StatelessWidget {
  final ManageContentController controller;
  final VoidCallback onCloseOrSavePressed;
  final ManageContentViewModel widgetMode;
  final Audio audioItem;

  const ManageAudioContentItem({
    @required this.controller,
    @required this.onCloseOrSavePressed,
    this.widgetMode = ManageContentViewModel.uploadAudioItem,
    this.audioItem,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDisplayDesktop = isDisplayDesktop(context);
    final _width = screenWidth(context);
    final editMode = widgetMode == ManageContentViewModel.editAudioItem;
    if (!editMode) controller.init();
    if (editMode) controller.initWithAudio(audioItem: audioItem);

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
            direction: _isDisplayDesktop ? Axis.horizontal : Axis.vertical,
            children: [
              Expanded(
                child: Text(
                  editMode
                      ? '${EditContentStrings.editTittle}'
                      : '${UploadContentStrings.uploadContent}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
                child: IconButton(
                  iconSize: 20,
                  icon: const Icon(Icons.close),
                  tooltip: UploadContentStrings.returnToHomeToolTip,
                  onPressed: () => onCloseOrSavePressed(),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, color: Color(0xFF525366)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: DottedBorder(
                    strokeWidth: 1,
                    color: const Color(0xFF8E8F99),
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: [8, 4],
                    child: Observer(
                      builder: (_) => GestureDetector(
                        onTap: () async => controller.selectAudioFile(),
                        child: Container(
                          width: screenWidth(context) / 2.5,
                          height: screenHeight(context) / 3,
                          child: (controller.isAudioFileSelcted || editMode)
                              ? _audioFileWasSeleted()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ManageContentImageAssets
                                        .webUploadPlaceholderCloud,
                                    const SizedBox(height: 25),
                                    const Text(
                                      UploadContentStrings.dragdDropAnAudio,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      UploadContentStrings.orBrowse,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: DottedBorder(
                    strokeWidth: 1,
                    color: const Color(0xFF8E8F99),
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: [8, 4],
                    child: Observer(
                      builder: (_) => GestureDetector(
                        onTap: () => controller.selectAudioCover(),
                        child: Container(
                          width: screenWidth(context) / 2.5,
                          height: screenHeight(context) / 3,
                          child: (controller.isAudioCoverFileSelcted ||
                                  editMode)
                              ? _audioCoverWasSelected(context: context)
                              : Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ManageContentImageAssets
                                        .webImagePlaceholder,
                                    const SizedBox(height: 20),
                                    const Text(
                                      '''${UploadContentStrings.upload} ${UploadContentStrings.coverPicture}''',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Container(
                width: _width / 3.5,
                height: screenHeight(context) / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      UploadContentStrings.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    UploadContentTextfield(
                      textEditingController: controller.titleController,
                      hintText: UploadContentStrings.enterTitle,
                      onEditingComplete: () {},
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      UploadContentStrings.hashtags,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Observer(
                      builder: (_) {
                        return TagsSuggestionTextField(
                          textEditingController: controller.hashtagsController,
                          tagsTextField: const TagsTextFieldViewModel(
                            suggestions: [
                              'Demo',
                              'Relaxing',
                              'Meditation',
                              'Chill-out',
                              'Party',
                            ],
                            hintText: UploadContentStrings.hashtags,
                          ),
                          onSubmitted: (tag) {
                            print('TagsSuggestionTextField $tag');
                            controller.addTag(tag);
                            print(controller.tags);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    Observer(
                      builder: (_) => SizedBox(
                        height: 60,
                        child: ManageContenAudioItemtTags(
                          tagItems: controller.tags,
                          onDelete: (tag) {
                            print('onDelete onDelete onDelete: $tag');
                            controller.deleteTag(tag);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      UploadContentStrings.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    UploadContentTextfield(
                      textEditingController: controller.descriptionController,
                      hintText: UploadContentStrings.tellMeAbout,
                      maxLines: 5,
                      height: 100,
                      onEditingComplete: () {},
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 32, left: _width / 3.5 - 200),
                      child: GradientRaisedButton(
                        minHeight: 38,
                        minWidth: 150,
                        label: editMode
                            ? EditContentStrings.update
                            : UploadContentStrings.upload,
                        buttonImage: ManageContentImageAssets.webUploadButton,
                        onPressed: () async {
                          if (editMode) {
                            await _updateAudioContentAndShowSuccessDialog(
                              context: context,
                              audioItem: audioItem,
                            );
                            onCloseOrSavePressed();
                          } else {
                            if (controller.isRequiredFieldsWereFilled) {
                              await _saveAudioContentAndShowSuccessDialog(
                                context: context,
                              );
                              onCloseOrSavePressed();
                            } else {
                              Scaffold.of(context).showSnackBar(
                                snackBarLight(
                                  message: UploadContentStrings.requiredText,
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _audioCoverWasSelected({@required BuildContext context}) {
    final editMode = widgetMode == ManageContentViewModel.editAudioItem;
    final hasAudioCoverFile = controller.audioCoverFile != null;
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (editMode && !hasAudioCoverFile)
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.network(
                  audioItem.artworkUrlPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const Text(
            EditContentStrings.changeCoverTittle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          if (hasAudioCoverFile) ...[
            Positioned(
              top: (screenHeight(context) / 3) / 2 + 20,
              child: Text(
                '${controller.audioCoverFile.name}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _audioFileWasSeleted() {
    final editMode = widgetMode == ManageContentViewModel.editAudioItem;
    final hasAudioFile = controller.audioFile != null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ManageContentImageAssets.desktopAudioHasSelectedIcon,
        const SizedBox(height: 10),
        if (hasAudioFile)
          Text(
            '${controller.audioFile.name}',
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        if (editMode && !hasAudioFile)
          Text(
            '${audioItem.title}',
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        const SizedBox(height: 10),
        const Text(
          EditContentStrings.changeAudioTittle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        // Container(
        //   color: const Color(0xFF525366),
        //   width: 270,
        //   height: 180,
        //   decoration: const BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //   ),
      ],
    );
  }

  Future<void> _saveAudioContentAndShowSuccessDialog({
    @required BuildContext context,
  }) async {
    await progressDialog(context: context).show();
    await controller.createAudio();
    await progressDialog(context: context).hide();
    showSuccessDialog(
      context: context,
      popsCount: 1,
      title: UploadContentStrings.contentUploaded,
      subTitle: UploadContentStrings.contentSuccessfullyUploaded,
      mainButtonImage: HomeImageAssets.webPortalFilleddButton,
      mainButtonTitle: UploadContentStrings.ok,
      isPresentedAsOverlay: false,
    );
  }

  Future<void> _updateAudioContentAndShowSuccessDialog({
    @required BuildContext context,
    @required Audio audioItem,
  }) async {
    await progressDialog(context: context).show();
    await controller.updateAudio(audioItem: audioItem);
    await progressDialog(context: context).hide();
    showSuccessDialog(
      context: context,
      popsCount: 1,
      title: EditContentStrings.updateSuccessful,
      subTitle: EditContentStrings.contentSuccessfullyUpdated,
      mainButtonImage: HomeImageAssets.webPortalFilleddButton,
      mainButtonTitle: UploadContentStrings.ok,
      isPresentedAsOverlay: false,
    );
  }
}
