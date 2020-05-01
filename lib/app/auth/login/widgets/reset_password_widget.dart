import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/login/login_controller.dart';
import 'package:highvibe/widgets/custom_text_form.dart';

void showResetPasswordDialog(
    BuildContext context, TextEditingController emailController) async {
  await AwesomeDialog(
    context: context,
    animType: AnimType.SCALE,
    dialogType: DialogType.WARNING,
    tittle: "Reset Password",
    body: Column(
      children: <Widget>[
        Text(
          "Enter Email To Reset Password!",
          // style:
          //     GoogleFonts.basic(textStyle: Theme.of(context).textTheme.title),
        ),
        SizedBox(height: 20),
        CustomTextForm(
          icon: Icons.person_outline,
          hint: "Email",
          controller: emailController,
          borderRadius: 10,
          maxLength: 15,
          validator: (s) => EmailValidator.validate(s) ? null : 'Invalid Email',
        ),
      ],
    ),
    btnOk: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: RaisedButton(
        onPressed: () {
          if (!EmailValidator.validate(emailController.text)) return;
          Modular.get<LoginController>().resetPassword(emailController.text);
          Modular.to.pop();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.green.shade400,
        child: Text(
          "OK",
          // style:
          //     GoogleFonts.basic().copyWith(color: Colors.white, fontSize: 20),
        ),
      ),
    ),
  ).show();
}
