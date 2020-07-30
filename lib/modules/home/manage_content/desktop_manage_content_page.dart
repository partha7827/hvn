import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/modules/home/manage_content/manage_content_contoller.dart';
import 'package:highvibe/modules/home/manage_content/widgets/mamange_content_litems_list.dart';
import 'package:highvibe/modules/home/manage_content/widgets/manage_content_audio_item.dart';
import 'package:highvibe/modules/home/manage_content/widgets/manage_content_view_model.dart';

class DesktopManageContentPage extends StatefulWidget {
  const DesktopManageContentPage({Key key}) : super(key: key);

  @override
  _DesktopManageContentPage createState() => _DesktopManageContentPage();
}

class _DesktopManageContentPage
    extends ModularState<DesktopManageContentPage, ManageContentController> {
  var _pageMode = ManageContentViewModel.displayContetItems;
  Audio _audioItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 34, 50, 44),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF212342),
          borderRadius: BorderRadius.circular(12),
        ),
        child: _configurePage(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _configurePage() {
    return () {
      switch (_pageMode) {
        case ManageContentViewModel.editAudioItem:
          return ManageAudioContentItem(
            controller: controller,
            widgetMode: ManageContentViewModel.editAudioItem,
            audioItem: _audioItem,
            onCloseOrSavePressed: () {
              setState(() {
                _pageMode = ManageContentViewModel.displayContetItems;
              });
            },
          );
        case ManageContentViewModel.uploadAudioItem:
          return ManageAudioContentItem(
            controller: controller,
            onCloseOrSavePressed: () {
              setState(() {
                _pageMode = ManageContentViewModel.displayContetItems;
              });
            },
          );
        default:
          return ManageContentItemsList(
            controller: controller,
            onUploadPressed: () {
              setState(() {
                _pageMode = ManageContentViewModel.uploadAudioItem;
              });
            },
            onEditPressed: (audioItem) {
              setState(() {
                _audioItem = audioItem;
                _pageMode = ManageContentViewModel.editAudioItem;
              });
            },
          );
      }
    }();
  }
}
