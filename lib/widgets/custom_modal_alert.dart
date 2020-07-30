import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/widgets.dart' show isDisplayWebDesktop;

class CustomModalAlert extends StatelessWidget {
  final String title;
  final String subTitle;
  final int popsCount;
  final Image mainButtonImage;
  final String mainButtonTitle;
  final Image secondButtonImage;
  final String secondButtonTitle;
  final VoidCallback secondButtonAction;
  final String artworkImagePath;
  final bool isPresentedAsOverlay;

  const CustomModalAlert({
    @required this.title,
    @required this.subTitle,
    this.popsCount = 2,
    this.mainButtonImage,
    this.mainButtonTitle = 'Save',
    this.secondButtonImage,
    this.secondButtonTitle,
    this.secondButtonAction,
    this.artworkImagePath,
    this.isPresentedAsOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasSecondButton =
        secondButtonImage != null && secondButtonTitle != null;
    final hasArtwork = artworkImagePath != null;
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
                  if (!hasArtwork) PlaylistImageAssets.checkMarkRounded,
                  if (hasArtwork) ...[
                    const SizedBox(height: 32),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        artworkImagePath,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
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
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Container(
                        width: isDisplayWebDesktop ? 140 : 160,
                        height: isDisplayWebDesktop ? 38 : 48,
                        child: GradientRaisedButton(
                          label: mainButtonTitle,
                          buttonImage: mainButtonImage,
                          onPressed: () => _close(context),
                        ),
                      ),
                      if (hasSecondButton) ...[
                        const SizedBox(width: 10),
                        Container(
                          width: isDisplayWebDesktop ? 140 : 160,
                          height: isDisplayWebDesktop ? 38 : 48,
                          child: GradientRaisedButton(
                            label: secondButtonTitle,
                            buttonImage: secondButtonImage,
                            onPressed: () => secondButtonAction(),
                          ),
                        ),
                      ]
                    ],
                  )
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
