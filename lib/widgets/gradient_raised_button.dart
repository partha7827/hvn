import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/widgets.dart';

class GradientRaisedButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final IconData icon;
  final bool isLoading;
  final double minHeight;
  final double minWidth;
  final Image buttonImage;
  final double radius;

  const GradientRaisedButton({
    this.onPressed,
    this.label,
    this.icon,
    this.isLoading = false,
    this.minHeight = 48,
    this.minWidth = 88,
    this.buttonImage,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: minWidth, minHeight: minHeight),
      decoration: !isDisplayWebDesktop
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: primaryGradient,
            )
          : null,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDisplayWebDesktop ? 0 : 16,
          ),
          child: isDisplayWebDesktop
              ? Stack(
                  children: [
                    buttonImage,
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                label,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(icon),
                      ),
                    if (isLoading)
                      const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    else
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
