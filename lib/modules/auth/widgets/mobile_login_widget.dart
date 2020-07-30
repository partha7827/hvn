import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:highvibe/modules/auth/login/login_controller.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class MobileLoginWidget extends StatelessWidget {
  final LoginController controller;

  const MobileLoginWidget({
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
          child: Column(
            children: <Widget>[
              Image.asset('assets/image_hvn.png', height: 120),
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
                  onPressed: () => AuthModule.toForgotPassword(
                    controller.emailController.text,
                  ),
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
                    onPressed: () async {
                      if (!controller.formKey.currentState.validate()) {
                        return null;
                      }
                      await progressDialog(context: context).show();
                      try {
                        await controller.loginUser();
                      } catch (e) {
                        showSnackBarMsg(
                            controller.scaffoldKey.currentState, e.toString());
                      } finally {
                        // await progressDialog(context: context).hide();
                      }
                    },
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
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(right: 8.0),
                  //     child: GradientOutlineButton(
                  //       icon: SvgPicture.asset('assets/ic_apple.svg'),
                  //       onPressed: () {},
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: Observer(
                      builder: (_) => Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        child: GradientOutlineButton(
                          isLoading: controller.inProgressFacebookLogIn,
                          icon: SvgPicture.asset('assets/ic_facebook.svg'),
                          onPressed: () async {
                            await progressDialog(context: context).show();
                            try {
                              await controller.facebookLogin();
                            } catch (e) {
                              showSnackBarMsg(
                                  controller.scaffoldKey.currentState,
                                  e.toString());
                            } finally {
                              //await progressDialog(context: context).hide();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Observer(
                      builder: (_) => Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GradientOutlineButton(
                          isLoading: controller.inProgressGoogleSignIn,
                          icon: SvgPicture.asset('assets/ic_google.svg'),
                          onPressed: () async {
                            await progressDialog(context: context).show();
                            try {
                              await controller.googleSignIn();
                            } catch (e) {
                              showSnackBarMsg(
                                  controller.scaffoldKey.currentState,
                                  e.toString());
                            } finally {
                              //await progressDialog(context: context).hide();
                            }
                          },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}