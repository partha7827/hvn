import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class ThankYouPage extends StatelessWidget {
  final String email;

  ThankYouPage({this.email});

  @override
  Widget build(BuildContext context) {
    print('args: $email');
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.thankYou,
              style: bold24PlayfairWhite,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 60),
              child: Text(
                Strings.emailToChangePassword(email),
                style: normal16Hint,
              ),
            ),
            GradientRaisedButton(
              label: Strings.backToLogin,
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
