import 'package:flutter/material.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';

class HeaderRow extends StatelessWidget {
  final String title;
  final bool showTrailing;
  final Function onPressedTrailing;
  final Widget leading;

  const HeaderRow({
    this.title,
    this.showTrailing = false,
    this.onPressedTrailing,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: leading,
                ),
              Text(
                title,
                style: bold20PlayfairWhite,
              ),
            ],
          ),
          if (showTrailing)
            FlatButton(
              child: Text(
                Strings.seeAll,
                style: normal16Accent,
              ),
              onPressed: onPressedTrailing,
            )
        ],
      ),
    );
  }
}
