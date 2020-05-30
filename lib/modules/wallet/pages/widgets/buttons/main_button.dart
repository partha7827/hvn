import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';

class MainButton extends StatelessWidget {
  final double height;
  final double fontSize;
  final String title;
  final EdgeInsets margin;
  final Function onPressed;
  final Widget icon;

  MainButton({
    this.title,
    this.height = 48,
    this.fontSize = 16,
    this.icon,
    this.margin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.buttonGradient),
        ),
        child: FlatButton(
          onPressed: onPressed,
          color: Colors.transparent,
          child: Container(
            height: height,
            alignment: Alignment.center,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: icon,
                margin: EdgeInsets.only(right: icon != null ? 10 : 0),
              ),
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: fontSize))
            ]),
          ),
        ),
      ),
    );
  }
}
