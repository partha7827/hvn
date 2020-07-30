import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:highvibe/modules/auth/register/register_controller.dart';
import 'package:highvibe/modules/auth/resources/resources.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/widgets.dart' show isDisplayDesktop;

class DesktopRegisterWidget extends StatelessWidget {
  final RegisterController controller;

  const DesktopRegisterWidget({
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDisplayDesktop = isDisplayDesktop(context);
    return Stack(
      children: [
        Container(
          key: controller.formKey,
          color: const Color(0xFF000222),
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 0),
              width: 449,
              height: 630,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AuthStrings.signUpWelcomeTittle,
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    AuthStrings.signUpWelcomeSubTittle,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  CustomTextForm(
                    hint: Strings.name,
                    icon: Icons.person_outline,
                    controller: controller.usernameController,
                    validator: (str) => str.length < 2 && str.isNotEmpty
                        ? 'Add a Name (min. 2 characters)'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  CustomTextForm(
                    hint: Strings.email,
                    icon: Icons.email,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (str) {
                      if (!EmailValidator.validate(str)) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextForm(
                    hint: Strings.password,
                    isObscure: true,
                    icon: Icons.lock_open,
                    controller: controller.passwordController,
                    validator: (str) {
                      if (str.length < 8 && str.isNotEmpty) {
                        return 'Must Contain At Least 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Observer(
                        builder: (_) {
                          return Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              activeColor: Theme.of(context).accentColor,
                              checkColor: Colors.yellow,
                              value: controller.hasAcceptedTerms,
                              onChanged: (value) {
                                controller.hasAcceptedTerms =
                                    !controller.hasAcceptedTerms;
                              },
                            ),
                          );
                        },
                      ),
                      Text(AuthStrings.acceptTerms, style: normal14White),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          showSnackBarMsg(
                            controller.scaffoldKey.currentState,
                            'Terms & Conditions',
                          );
                        },
                        child: const Text(
                          AuthStrings.terms,
                          style: TextStyle(
                            color: Color(0xFF666CCC),
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ), //
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Observer(
                    builder: (_) {
                      return GradientRaisedButton(
                        label: Strings.signUp,
                        isLoading: controller.inProgress,
                        buttonImage: AuthImageAssets.webGradientButton,
                        onPressed: () async {
                          try {
                            await controller.registerUser();
                          } catch (error) {
                            showSnackBarMsg(
                              controller.scaffoldKey.currentState,
                              error.toString(),
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    AuthStrings.loginWithSocialAccountTitle,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: AuthImageAssets.webAppleButton,
                        onTap: () {
                          print('webAppleButton');
                        },
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        child: AuthImageAssets.webFacebookButton,
                        onTap: () {
                          print('webFacebookButton');
                        },
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        child: AuthImageAssets.webGoogleButton,
                        onTap: () {
                          print('webGoogleButton');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        AuthStrings.signUpHaveAccountTittle,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: AuthModule.toLogin,
                        child: const Text(
                          Strings.login,
                          style: TextStyle(
                            color: Color(0xFF666CCC),
                            fontSize: 14,
                          ), //
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        if (_isDisplayDesktop) ...[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, top: 50),
              child: AuthImageAssets.webHvnLogoCompact,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: AuthImageAssets.webArtElementsSignupLeftBottom,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: AuthImageAssets.webArtElementsSignupRightTop,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 56, top: 421),
              child: AuthImageAssets.webArtElementsAuthBigTriangle,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 262, bottom: 200),
              child: AuthImageAssets.webArtElementsAuthSmallTriangle,
            ),
          ),
        ]
      ],
    );
  }
}
