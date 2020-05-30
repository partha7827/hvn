import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

import '../auth_module.dart';
import 'login_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  final String email;
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ForgotPasswordPage({this.email});

  @override
  Widget build(BuildContext context) {
    emailController.text = email ?? '';
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.forgotPassword,
                  style: bold24PlayfairWhite,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 40),
                  child: Text(
                    '''Enter your e-mail below and we will send you a link to create a new password.''',
                    style: normal16Hint,
                  ),
                ),
                CustomTextForm(
                  icon: Icons.mail_outline,
                  hint: Strings.email,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  autoFocus: true,
                  validator: (str) {
                    if (!EmailValidator.validate(str)) return 'Invalid Email';
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: GradientRaisedButton(
                    label: Strings.submit,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Modular.get<LoginController>()
                            .resetPassword(emailController.text);
                        AuthModule.toThankYouPage(emailController.text);
                      }
                    },
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
