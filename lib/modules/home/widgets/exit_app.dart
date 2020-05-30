import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';

showExitDialog(BuildContext context) async {
  bool shouldExit = false;
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          backgroundColor: AppColors.backgroundLightBlue,
          title: Text(
            Strings.exitConfirmation,
            style: bold18PlayfairWhite,
          ),
          actions: <Widget>[
            DialogFlatButton(
              title: Strings.yes,
              onPressed: () {
                Modular.to.pop();
                shouldExit = true;
              },
            ),
            DialogFlatButton(
              title: Strings.no,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Modular.to.pop();
                shouldExit = false;
              },
            ),
          ],
        );
      });
  return shouldExit;
}

class DialogFlatButton extends StatelessWidget {
  const DialogFlatButton({
    Key key,
    this.title = '',
    @required this.onPressed,
    this.color = Colors.transparent,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      onPressed: onPressed,
      child: Text(
        '$title',
      ),
    );
  }
}
