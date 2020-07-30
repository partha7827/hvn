import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:highvibe/modules/auth/login/login_controller.dart';
import 'package:highvibe/modules/auth/resources/resources.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/widgets.dart' show isDisplayDesktop;

class DesktopLoginWidget extends StatefulWidget {
  final LoginController controller;

  DesktopLoginWidget({
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  _DesktopLoginWidgetState createState() => _DesktopLoginWidgetState();
}

class _DesktopLoginWidgetState extends State<DesktopLoginWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _isDisplayDesktop = isDisplayDesktop(context);
    return Stack(
      children: [
        Container(
          key: widget.controller.formKey,
          color: const Color(0xFF000222),
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 0),
              width: 449,
              height: 600,
              child: Column(
                children: [
                  AuthImageAssets.webHvnLogoMedium,
                  const SizedBox(height: 40),
                  CustomTextForm(
                    hint: Strings.email,
                    icon: Icons.email,
                    controller: widget.controller.emailController,
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
                    controller: widget.controller.passwordController,
                    validator: (str) {
                      if (str.length < 8 && str.isNotEmpty) {
                        return 'Must Contain At Least 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  Observer(
                    builder: (_) {
                      return RawKeyboardListener(
                        focusNode: _focusNode,
                        autofocus: true,
                        onKey: _onLoginWithEmailEnterKeyPressed,
                        child: GradientRaisedButton(
                          label: Strings.login,
                          buttonImage: AuthImageAssets.webGradientButton,
                          isLoading: widget.controller.inProgress,
                          onPressed: () async => _loginWithEmailUser(),
                        ),
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
                          showSnackBarMsg(
                            widget.controller.scaffoldKey.currentState,
                            'Log In With Apple is not implemented yet!',
                          );
                        },
                      ),
                      const SizedBox(width: 20),
                      Observer(
                        builder: (_) {
                          return GestureDetector(
                            child: AuthImageAssets.webFacebookButton,
                            onTap: () {
                              showSnackBarMsg(
                                widget.controller.scaffoldKey.currentState,
                                'Log In With Facebook is not implemented yet!',
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(width: 20),
                      Observer(
                        builder: (_) {
                          return GestureDetector(
                            child: AuthImageAssets.webGoogleButton,
                            onTap: () {
                              showSnackBarMsg(
                                widget.controller.scaffoldKey.currentState,
                                'Log In With Google is not implemented yet!',
                              );
                            },
                          );
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
                        AuthStrings.loginDontHaveAccountTittle,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: AuthModule.toRegister,
                        child: const Text(
                          Strings.signUp,
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
              child: AuthImageAssets.webArtElementsLoginLeftBottom,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 154, bottom: 154),
              child: AuthImageAssets.webArtElementsAuthHugeTriangle,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: AuthImageAssets.webArtElementsLoginRightTop,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 22, top: 421),
              child: AuthImageAssets.webArtElementsAuthBigTriangle,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 228, bottom: 200),
              child: AuthImageAssets.webArtElementsAuthSmallTriangle,
            ),
          ),
        ]
      ],
    );
  }

  Future<void> _loginWithEmailUser() async {
    try {
      await widget.controller.loginUser();
    } catch (error) {
      Scaffold.of(context).showSnackBar(
        snackBarLight(message: error.toString()),
      );
    }
  }

  void _onLoginWithEmailEnterKeyPressed(RawKeyEvent event) async {
    if (event.logicalKey == LogicalKeyboardKey.enter) {
      await _loginWithEmailUser();
    }
  }
}
