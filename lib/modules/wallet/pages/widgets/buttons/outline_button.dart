import 'package:flutter/material.dart';
import 'package:hvn/modules/wallet/resources/app_colors.dart';

class OutlineButton extends StatelessWidget {
  final double height;
  final double fontSize;
  final String title;
  final EdgeInsets margin;
  final Function onPressed;
  final Widget icon;

  OutlineButton({this.title, this.height = 48, this.fontSize = 16, this.icon, this.margin, this.onPressed});

  Widget build(BuildContext context) { 
    return Container(
      margin: margin,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.textBlue, width: 2)
        ),
        child: FlatButton(
          onPressed: onPressed,
          color: Colors.transparent,
          child: Container(
            height: height,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: icon,
                  margin: EdgeInsets.only(right: icon != null ? 10 : 0),
                ),
                Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textBlue,
                    fontSize: fontSize
                  )
                )
              ]
            ),
          ),
        )
      )
    
      
    );
  }
}