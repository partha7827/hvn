import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/values/themes.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key key,
    this.iconPath = '',
    this.title = '',
    this.onTap,
    this.isLogout = false,
  }) : super(key: key);

  final String iconPath, title;
  final Function onTap;
  final bool isLogout;

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
        style: isLogout ? normal18White : normal16White,
      ),
    );
  }
}
