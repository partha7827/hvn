import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';

class UserContainer extends StatelessWidget {
  final EdgeInsets margin;
  final Function onPressed;
  final Color textColor;

  UserContainer({this.margin, this.onPressed, this.textColor = Colors.white});

  Widget build(BuildContext context) { 
    return InkWell(
      onTap: onPressed,
        child: Container(
        margin: margin,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network('https://www.fillmurray.com/300/300',
                width: 50,
                height: 50,
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bill Murray fdssf ddf ',
                      maxLines: 1,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text('hvn.one/bill',
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12
                        ),
                      )
                    ),
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}