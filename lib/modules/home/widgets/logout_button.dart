import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/values/themes.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key key,
    this.iconPath = '',
    this.title = '',
    this.onTap,
  }) : super(key: key);

  final String iconPath, title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 32),
      onTap: onTap,
      leading: SvgPicture.asset(
        iconPath,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: normal18White,
      ),
    );
  }
}
