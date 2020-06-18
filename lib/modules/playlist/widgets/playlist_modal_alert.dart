import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class PlaylistModalAlert extends StatelessWidget {
  final String title;
  final String subTitle;
  final String buttonTitle;
  final int popsCount;
  final bool isPresentedAsOverlay;

  const PlaylistModalAlert({
    @required this.title,
    @required this.subTitle,
    this.isPresentedAsOverlay = false,
    this.popsCount = 2,
    this.buttonTitle = PlaylistStrings.save,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration:
            BoxDecoration(color: AppColors.backgroundDarkBlue.withOpacity(0.6)),
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              width: 335,
              height: 368,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF525366),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF212342),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  PlaylistImageAssets.checkMarkRounded,
                  const SizedBox(height: 32),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    subTitle,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 43),
                  Container(
                    width: 160,
                    height: 48,
                    child: GradientRaisedButton(
                      label: buttonTitle,
                      onPressed: () => _close(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _close(BuildContext context) {
    if (isPresentedAsOverlay) {
      MediaOverlays.disposeModalAlertOverlayEntry();
      MediaOverlays.disposeCreateNewPlaylistOverlayEntry();
    } else {
      popUntil(
        numberOfPops: popsCount,
        context: context,
      );
    }
  }
}
