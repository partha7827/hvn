import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/show_playlists/show_playlists_module.dart';
import 'package:highvibe/modules/profile/achievements/achievements_module.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/profile/show_audio/show_audio_module.dart';
import 'package:highvibe/modules/profile/widgets/build_tabs_header.dart';
import 'package:highvibe/modules/profile/widgets/profile_widget.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:mobx/mobx.dart';
import 'package:highvibe/modules/playlist/widgets/ui_utils.dart';
import 'package:highvibe/utils/supported_audio_types.dart';

import 'current_user_controller.dart';

class CurrentUserPage extends StatefulWidget {
  final String title;
  const CurrentUserPage({Key key, this.title = 'OtherUser'}) : super(key: key);

  @override
  _CurrentUserPageState createState() => _CurrentUserPageState();
}

class _CurrentUserPageState
    extends ModularState<CurrentUserPage, CurrentUserController>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    when(
      (_) => controller.currentStep == UploadAudioStep.chooseAudio,
      () async {
        print('choose audio reaction');
        File file;
        var isAudioFileType = true;

        if (Platform.isIOS) {
          file = await FilePicker.getFile(type: FileType.any);
          isAudioFileType = isAudioFile(file: file);
        } else {
          file = await FilePicker.getFile(type: FileType.audio);
          isAudioFileType = isAudioFile(file: file);
        }

        if (isAudioFileType) {
          controller.nextStep(data: file);
        } else {
          Modular.to.pop();
        }
      },
    );
    when((_) => controller.currentStep == UploadAudioStep.success, () async {
      print('success');
      showSuccessDialog(
        context: context,
        isPresentedAsOverlay: false,
        title: 'Karma Reward',
        subTitle: 'You received ${controller.audio.karmaReward} Karma',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProfileWidget(
      showFab: true,
      userName: controller.currentUser.name,
      userStatus: controller.currentUser.status,
      userBio: controller.currentUser.bio,
      userAvatar: controller.currentUser.photoUrl,
      uploadAudio: () => controller.chooseAudio(),
      userFollowersWidget: Observer(
        builder: (_) {
          return Column(
            children: <Widget>[
              Text(
                controller.currentUser.followers.length.toString(),
                style: bold20White,
              ),
              Text('Followers', style: normal16Hint)
            ],
          );
        },
      ),
      userFollowingWidget: Observer(builder: (_) {
        return Column(
          children: <Widget>[
            Text(
              controller.currentUser.following.length.toString(),
              style: bold20White,
            ),
            Text('Following', style: normal16Hint)
          ],
        );
      }),
      buttonWidget: GradientOutlineButton(
        label: Text(Strings.editProfile, style: normal16Accent),
        onPressed: () => ProfileModule.toEditProfile(),
      ),
      tabBar: buildTabsHeader(tabController, () => setState(() {})),
      tabView: TabBarView(
        controller: tabController,
        children: <Widget>[
          ShowAudioModule(controller.currentUser.id),
          ShowPlaylistsModule(userId: controller.currentUser.id),
          AchievementsModule(controller.currentUser),
        ],
      ),
      audioUploadWidget: _audioUploadWidget(),
    );
  }

  Observer _audioUploadWidget() {
    return Observer(
      builder: (_) {
        if (!controller.isUploading) {
          return Container();
        }

        return Observer(
          builder: (context) {
            return StreamBuilder<StorageTaskEvent>(
              stream: controller.storageUploadTask.events,
              builder: (context, snapshot) {
                final event = snapshot?.data?.snapshot;

                final progressPercent = event != null
                    ? event.bytesTransferred / event.totalByteCount
                    : 0.0;

                return _uploadProgress(progressPercent, context);
              },
            );
          },
        );
      },
    );
  }

  Column _uploadProgress(double progressPercent, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: Colors.black54,
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Uploading ${(progressPercent * 100).toInt()}% ',
                  style: normal14White,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white24,
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: 4,
                    width: screenWidth(context) * progressPercent * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: primaryGradientHorizontal,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 18,
                ),
                onPressed: () {
                  controller.storageUploadTask.cancel();
                  controller.currentStep = UploadAudioStep.none;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
