import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/create_password/create_password_controller.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_rounded_button.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
import 'package:highvibe/utils/utils.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({
    this.user,
  });

  final User user;

  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState
    extends ModularState<CreatePassword, CreatePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      Strings.createPassword,
                      style: bold30PlayfairWhite,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 40,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomTextForm(
                        hint: Strings.password,
                        isObscure: true,
                        icon: Icons.lock_open,
                        controller: controller.passwordController,
                        validator: (str) {
                          if (str.length < 8 && str.isNotEmpty) {
                            return Strings.passwordValidationError;
                          }
                          return null;
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 40,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomTextForm(
                        hint: Strings.retypePassword,
                        isObscure: true,
                        icon: Icons.lock_open,
                        controller: controller.retypePasswordController,
                        validator: (str) {
                          if (str.length < 8 && str.isNotEmpty) {
                            return Strings.passwordValidationError;
                          }

                          if (controller.passwordController.text !=
                              controller.retypePasswordController.text) {
                            return Strings.passwordMismatch;
                          }

                          return null;
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 40,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          Strings.passwordStrength,
                          style: normal13White,
                        ),
                        Text(
                          Strings.strong,
                          style: normal13Green,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                3,
                              ),
                              color: greenColor,
                            ),
                            height: 3,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                3,
                              ),
                              color: greenColor,
                            ),
                            height: 3,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                3,
                              ),
                              color: greenColor,
                            ),
                            height: 3,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                3,
                              ),
                              color: secondaryColor,
                            ),
                            height: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 86),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: GradientRoundedRaisedButton(
                      label: Strings.done,
                      onPressed: () {
                        if (controller.formKey.currentState.validate()) {
                          controller.completeSignUp(context, widget.user);
                          showSignUpSuccessDialog();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSignUpSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.grey,
          content: Container(
            width: screenWidth(context),
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              gradient: primaryGradient,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 49,
                      top: 12,
                    ),
                    child: Image.asset(
                      'assets/ic_clap.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    Strings.congratulations,
                    style: bold24PlayfairWhite,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    Strings.welcomeToHighVibe,
                    style: normal18Hint,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 40,
                    ),
                    child: GradientRoundedRaisedButton(
                      label: Strings.enterTheHighVibeEcosystem,
                      onPressed: () {
                        Modular.to.pop();
                        controller.navigateToHome(widget.user);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
