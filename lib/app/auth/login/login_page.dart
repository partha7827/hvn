import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/app/auth/login/widgets/reset_password_widget.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

import '../auth_module.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({this.title = "Login"});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build login");
    return Scaffold(
      key: controller.scaffoldKey,
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/image_hvn.png',
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CustomTextForm(
                    hint: Strings.email,
                    icon: Icons.email,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (str) {
                      if (!EmailValidator.validate(str)) return 'Invalid Email';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CustomTextForm(
                      hint: Strings.password,
                      isObscure: true,
                      icon: Icons.lock_open,
                      controller: controller.passwordController,
                      validator: (str) {
                        if (str.length < 8 && str.isNotEmpty) {
                          return 'Must Contain At Least 8 characters';
                        }
                        return null;
                      }),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    onPressed: () => showResetPasswordDialog(
                        context, controller.emailController),
                    child: Text(
                      Strings.forgotPassword,
                      style: normal14White,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Observer(
                    builder: (_) => GradientRaisedButton(
                      label: Strings.login,
                      isLoading: controller.inProgress,
                      onPressed: controller.loginUser,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'or login with your social account',
                    style: normal14White,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.only(right: 8),
                        child: RaisedButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/ic_facebook.svg'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: const Color(0xFF2B5C93),
                          label: Text(
                            Strings.facebook,
                            style: normal16White,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.only(left: 8),
                        child: RaisedButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/ic_google.svg'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: const Color(0xFFCF4332),
                          label: Text(
                            Strings.google,
                            style: normal16White,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        Strings.dontHaveAccount,
                        style: normal16White,
                      ),
                      FlatButton(
                        onPressed: AuthModule.toRegister,
                        child: Text(
                          Strings.signUp,
                          style: normal16Accent,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
