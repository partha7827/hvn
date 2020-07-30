import 'package:flutter/material.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/widgets/widgets.dart' show CustomModalAlert;
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog progressDialog({@required BuildContext context}) {
  return ProgressDialog(
    context,
    type: ProgressDialogType.Normal,
    isDismissible: false,
    showLogs: false,
  );
}

void showSuccessDialog({
  @required BuildContext context,
  @required bool isPresentedAsOverlay,
  @required String title,
  @required String subTitle,
  int popsCount,
  Image mainButtonImage,
  String mainButtonTitle,
  Image secondButtonImage,
  String secondButtonTitle,
  VoidCallback secondButtonAction,
  String artworkImagePath,
}) {
  final modalAlert = CustomModalAlert(
    title: title,
    subTitle: subTitle,
    popsCount: popsCount,
    mainButtonImage: mainButtonImage,
    mainButtonTitle: mainButtonTitle,
    secondButtonImage: secondButtonImage,
    secondButtonTitle: secondButtonTitle,
    secondButtonAction: secondButtonAction,
    artworkImagePath: artworkImagePath,
    isPresentedAsOverlay: isPresentedAsOverlay,
  );

  if (isPresentedAsOverlay) {
    MediaOverlays.presentShowDialogAsOverlay(
      context: context,
      modalAlert: modalAlert,
    );
  } else {
    showDialog(context: context, builder: (_) => modalAlert);
  }
}
