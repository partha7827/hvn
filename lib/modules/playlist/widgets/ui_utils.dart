import 'package:flutter/material.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
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
}) {
  final modalAlert = PlaylistModalAlert(
    title: title,
    subTitle: subTitle,
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
