import 'package:flutter/material.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class PlaylistModalAlert extends StatelessWidget {
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
                const Text(
                  PlaylistStrings.newPlaylistSuccessTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  PlaylistStrings.newPlaylistSuccessSubTitle,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 43),
                Container(
                  width: 160,
                  height: 48,
                  child: GradientRaisedButton(
                    label: PlaylistStrings.save,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
