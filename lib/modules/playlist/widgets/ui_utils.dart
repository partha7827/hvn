import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/values/themes.dart';
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

void showProgressDialog(
  BuildContext context, {
  bool barrierDismissable = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissable,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: secondaryColor,
      title: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SpinKitFadingCube(
              color: Colors.white,
              duration: Duration(seconds: 2),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Text(
                'Loading...',
                style: normaBoldl16White,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
